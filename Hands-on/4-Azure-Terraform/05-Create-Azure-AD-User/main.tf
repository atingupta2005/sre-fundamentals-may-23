terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.1.1"
    }
  }
}

provider "azuread" {
}

resource "azuread_user" "user" {
  user_principal_name = "ating-@atttrainings.com"
  display_name        = "Atin Gupta"
  mail_nickname       = "atingupta"
  password            = "LjmUJk@123456"
}

resource "azuread_group" "group" {
  name = "MyTerraformGroup"
  members = [
    azuread_user.user.object_id,
  ]
}
