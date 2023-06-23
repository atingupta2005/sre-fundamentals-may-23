# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }    
  }

  # Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "rgtfstate"
    storage_account_name  = "satfstateag23"
    container_name        = "tfstates"
    key                   = "terraform-01.tfstate"
  } 
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create Resource Group 
resource   "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
      name = "my-demo-rg1"  
}

resource   "azurerm_resource_group" "my_demo_rg2" {
     location = "eastus"
  name = "my-demo-rg30"  
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"
  # insert the 3 required variables here
  resource_group_name = azurerm_resource_group.my_demo_rg2.name
  use_for_each = false
  vnet_location = "eastus"
}


output "resource_group_id" {
 value = resource.azurerm_resource_group.my_demo_rg1.id
}

output "resource_group_name" {
 value = resource.azurerm_resource_group.my_demo_rg1.name
}

