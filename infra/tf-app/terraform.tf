terraform {
  backend "azurerm" {
    resource_group_name  = "041052496-githubactions-rg"
    storage_account_name = "041052496githubactionss"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
