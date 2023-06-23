## Step-01: Introduction

[![Image](Hands-on/01-Azure/course-images/azure-terraform-workflow-1.png "Terraform on Azure")](Hands-on/01-Azure/course-images/azure-terraform-workflow-1.png)

[![Image](Hands-on/01-Azure/course-images/azure-terraform-workflow-2.png "Terraform on Azure")](Hands-on/01-Azure/course-images/azure-terraform-workflow-2.png)

## Step-02: Review terraform manifests
- **Pre-Conditions:** If not done earlier, complete `az login` via Azure CLI. We are going to use Azure CLI Authentication for Terraform when we use Terraform Commands.
```t
# Azure CLI Login
az login

# List Subscriptions
az account list

# Set Specific Subscription (if we have multiple subscriptions)
az account set --subscription="SUBSCRIPTION_ID"
```

```t
# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" # Optional but recommended in production
    }    
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
# Create Resource Group
resource "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
  name = "my-demo-rg1"  
}
```

## Step-03: Terraform Core Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create Resources
terraform apply
```

## Step-04: Verify Azure Resource Group in Azure Management Console
- Go to Azure Management Console -> Resource Groups
- Verify newly created Resource Group
- Review `terraform.tfstate` file

## Step-05: Destroy Infrastructure
```t
# Destroy Azure Resource Group
terraform destroy
Observation:
1. Verify if the resource group got deleted in Azure Management Console
2. Verify terraform.tfstate file and resource group info should be removed
```
