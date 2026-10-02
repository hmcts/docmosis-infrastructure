module "networking" {
  source = "git@github.com:hmcts/terraform-module-azure-virtual-networking?ref=main"

  env         = var.env
  product     = var.product
  common_tags = var.common_tags
  component   = "network"

  vnets = {
    vnet = {
      address_space = [var.vnet_address_space]
      subnets = {
        private-endpoints = {
          address_prefixes = [var.subnet1_address_prefix]
        }
      }
    }
  }
  route_tables = {
    rt = {
      subnets = ["vnet-private-endpoints"]
      routes = {
        default = {
          address_prefix         = "0.0.0.0/0"
          next_hop_type          = "VirtualAppliance"
          next_hop_in_ip_address = "10.10.200.36"
        }
      }
    }
  }
}

module "vnet_peer_hub_sbox" {
  source = "github.com/hmcts/terraform-module-vnet-peering"

  peerings = {
    source = {
      name           = "hub"
      vnet           = module.networking.vnet["vnet"].name
      resource_group = module.networking.vnet["vnet"].resource_group
    }
    target = {
      name           = format("%s%s", var.project, var.env)
      vnet           = local.hub[local.hub_name].ukSouth.name
      resource_group = local.hub[local.hub_name].ukSouth.name
    }
  }

  providers = {
    azurerm.initiator = azurerm
    azurerm.target    = azurerm.hub
  }
}
