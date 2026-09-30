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
}
