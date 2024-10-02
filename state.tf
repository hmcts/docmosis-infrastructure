terraform {
  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.1"
    }
  }

	required_version = ">= 1.1.7"
}

provider "azurerm" {
  features {}
}