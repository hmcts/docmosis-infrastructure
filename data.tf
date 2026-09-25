data "azurerm_user_assigned_identity" "jenkins" {
  name                = var.env == "sandbox" ? "jenkins-sbox-mi" : "jenkins-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}
