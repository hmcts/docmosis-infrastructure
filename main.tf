resource "azurerm_resource_group" "infrastructure_resource_group" {
  name     = "${var.product}-infra-${var.env}"
  location = var.location

  tags = module.tags.common_tags
}