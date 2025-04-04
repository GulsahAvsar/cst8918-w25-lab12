resource "azurerm_resource_group" "app_rg" {
  name     = "041052496-a12-rg"
  location = "Canada Central"
}


output "resource_group_name" {
  value = azurerm_resource_group.app_rg.name
}
