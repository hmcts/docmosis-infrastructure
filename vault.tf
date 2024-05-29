module "vault" {
  source                               = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name                                 = "${var.product}-infra-${var.env}"
  product                              = var.product
  env                                  = var.env
  object_id                            = var.jenkins_AAD_objectId
  resource_group_name                  = azurerm_resource_group.infrastructure_resource_group.name
  product_group_object_id              = "e7ea2042-4ced-45dd-8ae3-e051c6551789" # DTS Platform Operations
  common_tags                          = local.tags
}

output "vaultName" {
  value = module.vault.key_vault_name
}