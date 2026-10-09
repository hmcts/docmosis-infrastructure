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
  role_definition_id = "2a2b9908-6ea1-4ae2-8e65-a410df84e7d1" # storage blob data reader
  principal_id       = data.azurerm_user_assigned_identity.jenkins.client_id

  schedule {
    start_date_time = time_static.pim_start.rfc3339
    expiration {
      duration_days = "7"
    }
  }
}
