module "this" {
  count                    = var.env == "sandbox" ? 1 : 0
  source                   = "git@github.com:hmcts/cnp-module-storage-account?ref=master"
  env                      = var.env
  storage_account_name     = "${var.product}${var.env}sa"
  resource_group_name      = azurerm_resource_group.infrastructure_resource_group.name
  location                 = var.location
  account_kind             = var.account_kind
  account_replication_type = var.account_replication_type
  containers = [{
    name        = "templates"
    access_type = "private"
  }]

  private_endpoint_subnet_id = "/subscriptions/b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb/resourceGroups/cft-sbox-network-rg/providers/Microsoft.Network/virtualNetworks/cft-sbox-vnet/subnets/private-endpoints"
  sa_subnets                 = [data.azurerm_subnet.jenkins_subnet.id, data.azurerm_subnet.aks_00_subnet.id, data.azurerm_subnet.aks_01_subnet.id]

  common_tags = var.common_tags

  managed_identity_object_id = module.vault.managed_identity_objectid[0]

  role_assignments = [
    "Storage Blob Data Reader"
  ]
}

