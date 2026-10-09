locals {
  tags = var.common_tags
}

resource "azurerm_resource_group" "infrastructure_resource_group" {
  name     = "${var.product}-infrastructure-${var.env}"
  location = var.location

  tags = local.tags
}

resource "time_static" "pim_start" {}

resource "azurerm_pim_eligible_role_assignment" "this" {
  scope              = module.this[0].storageaccount_id
  role_definition_id = "b7e6dc6d-f1e8-4753-8033-0f276bb0955b" # storage blob data owner
  principal_id       = data.azurerm_user_assigned_identity.jenkins.id

  schedule {
    start_date_time = time_static.pim_start.rfc3339
    expiration {
      duration_days = "7"
    }
  }
}
