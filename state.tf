terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.50.0"
    }
  }

  required_version = ">= 1.1.7"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias = "aks"
  features {}
  subscription_id = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb"
}

provider "azurerm" {
  alias = "vpn"
  features {}
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
}

provider "azurerm" {
  alias = "mgmt"
  features {}
  subscription_id = "1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
}

provider "azurerm" {
  subscription_id                 = local.hub[local.hub_name].subscription
  resource_provider_registrations = "none"
  features {}
  alias = "hub"
}
