#Azure provider to start out with
# this allows terraform to communicate with the Azure API
# this is how terraform can deploy resources to Azure.  This is
# very similar to the AWS provider setup for terraform.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli
# # Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
      # version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

