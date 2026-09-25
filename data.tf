data "azurerm_user_assigned_identity" "jenkins" {
  name                = var.env == "sandbox" ? "jenkins-sbox-mi" : "jenkins-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

data "azurerm_virtual_network" "mgmt_vnet" {
  name                = var.env == "sandbox" ? "cft-ptl-sbox-vnet" : "cft-ptl-vnet"
  resource_group_name = var.env == "sandbox" ? "cft-ptlsbox-network-rg" : "cft-ptl-network-rg"
}

data "azurerm_subnet" "jenkins_subnet" {
  name                 = "iaas"
  virtual_network_name = data.azurerm_virtual_network.mgmt_vnet.name
  resource_group_name  = data.azurerm_virtual_network.mgmt_vnet.resource_group_name
}
