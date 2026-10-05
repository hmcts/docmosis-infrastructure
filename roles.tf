resource "azurerm_role_assignment" "blob_contributors" {
  scope                = module.this[0].storageaccount_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_group.docmosis_upload.object_id
}
