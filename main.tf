locals {
  tags = var.common_tags
}

resource "azurerm_resource_group" "infrastructure_resource_group" {
  name     = "${var.product}-infrastructure-${var.env}"
  location = var.location

  tags = local.tags
}

import {
  to = azurerm_resource_group.infrastructure_resource_group
  id = "/subscriptions/****/resourceGroups/docmosis-infrastructure-aat"
}