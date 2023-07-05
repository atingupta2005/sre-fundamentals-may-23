terraform {
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "3.57.0"
  }
}
}

provider "azurerm" {
  subscription_id = "6dbee8a4-5e0b-4708-8be6-9e95afc83a78"
  features {}
}
