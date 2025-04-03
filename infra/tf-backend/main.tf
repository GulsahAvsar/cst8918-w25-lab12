terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  required_version = ">= 1.4"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend_rg" {
  name     = "041052496-githubactions-rg"
  location = "Canada Central"
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "041052496githubactionss"
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend_sa.name
  container_access_type = "private"
}

output "resource_group_name" {
  value = azurerm_resource_group.backend_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.backend_sa.name
}

output "container_name" {
  value = azurerm_storage_container.backend_container.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.backend_sa.primary_access_key
  sensitive = true
}
