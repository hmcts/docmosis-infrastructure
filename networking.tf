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
          next_hop_in_ip_address = "10.10.200.36/32"
        }
      }
    }
  }
}
