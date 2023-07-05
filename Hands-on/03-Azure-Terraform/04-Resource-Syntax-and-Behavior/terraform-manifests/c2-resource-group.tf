# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  name     = "u50rg-1"
  location = "East US"
}