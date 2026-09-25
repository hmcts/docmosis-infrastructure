module "this" {
  count                    = var.env == "sandbox" ? 1 : 0
  source                   = "git@github.com:hmcts/cnp-module-storage-account?ref=4.x"
  env                      = var.env
  storage_account_name     = "${var.product}${var.env}sa"
  resource_group_name      = azurerm_resource_group.infrastructure_resource_group.name
  location                 = var.location
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type
  containers               = ["templates", "images"]

  common_tags = var.common_tags

  managed_identity_object_id = module.vault.managed_identity_objectid[0]

  role_assignments = [
    "Storage Blob Data Reader"
  ]
}

