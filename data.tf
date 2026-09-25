data "azurerm_user_assigned_identity" "jenkins" {
  name                = var.env == "sandbox" ? "jenkins-sbox-mi" : "jenkins-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

data "azurerm_virtual_network" "mgmt_vnet" {
  provider            = azurerm.mgmt
  name                = var.env == "sandbox" ? "cft-ptlsbox-vnet" : "cft-ptl-vnet"
  resource_group_name = var.env == "sandbox" ? "cft-ptlsbox-network-rg" : "cft-ptl-network-rg"
}

data "azurerm_subnet" "jenkins_subnet" {
  provider             = azurerm.mgmt
  name                 = "iaas"
  virtual_network_name = data.azurerm_virtual_network.mgmt_vnet.name
  resource_group_name  = data.azurerm_virtual_network.mgmt_vnet.resource_group_name
}

data "azurerm_virtual_network" "aks_vnet" {
  provider            = azurerm.aks
  name                = var.env == "sandbox" ? "cft-sbox-vnet" : "cft-${var.env}-vnet"
  resource_group_name = var.env == "sandbox" ? "cft-sbox-network-rg" : "cft-${var.env}-network-rg"
}

data "azurerm_subnet" "aks_00_subnet" {
  provider             = azurerm.aks
  name                 = "aks-00"
  virtual_network_name = data.azurerm_virtual_network.aks_vnet.name
  resource_group_name  = data.azurerm_virtual_network.aks_vnet.resource_group_name
}

data "azurerm_subnet" "aks_01_subnet" {
  provider             = azurerm.aks
  name                 = "aks-01"
  virtual_network_name = data.azurerm_virtual_network.aks_vnet.name
  resource_group_name  = data.azurerm_virtual_network.aks_vnet.resource_group_name
}
