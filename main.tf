locals {
  tags = var.common_tags
}

resource "azurerm_resource_group" "infrastructure_resource_group" {
  name     = "${var.product}-infrastructure-${var.env}"
  location = var.location

  tags = local.tags
}

data "azurerm_client_config" "current" {}

resource "time_static" "pim_start" {}

data "azurerm_role_definition" "role_name" {

  name  = "Storage Blob Data Owner"
  scope = data.azurerm_client_config.current.subscription_id
}

resource "azurerm_pim_eligible_role_assignment" "this" {
  scope              = "subscriptions/${data.azurerm_client_config.current.subscription_id}"
  role_definition_id = data.azurerm_role_definition.role_name.id
  principal_id       = data.azurerm_user_assigned_identity.jenkins.client_id

  schedule {
    start_date_time = time_static.pim_start.rfc3339
    expiration {
      duration_days = "7"
    }
  }
}
