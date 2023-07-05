# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name = "u50-rg-remote"
  location = "East US"
}