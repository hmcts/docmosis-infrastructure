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
  alias = "mgmt"
  features {}
  subscription_id = "1497c3d7-ab6d-4bb7-8a10-b51d03189ee3"
}

provider "azurerm" {
  alias = "aks"
  features {}
  subscription_id = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb"
}
