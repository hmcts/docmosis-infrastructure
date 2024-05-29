locals {
  tags = var.common_tags
}

resource "azurerm_resource_group" "infrastructure_resource_group" {
  name     = "${var.product}-infra-${var.env}"
  location = var.location

  tags = local.tags
}