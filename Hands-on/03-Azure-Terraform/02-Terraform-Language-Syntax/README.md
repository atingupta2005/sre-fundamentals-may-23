## Step-01: Introduction
- Understand Terraform Language Basics


## Step-02: Terraform Configuration Language Syntax
- Understand Blocks
- Understand Arguments
- Understand Identifiers
- Understand Comments
```t
# Template
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>"   {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

# Azure Example
# Create a resource group
resource "azurerm_resource_group" "myrg" { # Resource BLOCK
  name = "myrg-1" # Argument
  location = "East US" # Argument
}
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" { # Resource BLOCK
  name                = "myvnet-1" # Argument
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location # Argument with value as expression
  resource_group_name = azurerm_resource_group.myrg.name # Argument with value as expression
}
```

