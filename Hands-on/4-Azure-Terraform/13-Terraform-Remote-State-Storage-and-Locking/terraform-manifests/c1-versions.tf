# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
	  
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "rgtfstate"
    storage_account_name  = "satfstateag23"
    container_name        = "tfstates"
    key                   = "terraform-16.tfstate"
  } 
}

# Provider Block
provider "azurerm" {
 subscription_id = "580100b9-7996-4288-ac08-12838e04cd5b"
 features {}          
}
