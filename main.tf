#Azure provider to start out with
# this allows terraform to communicate with the Azure API
# this is how terraform can deploy resources to Azure.  This is
# very similar to the AWS provider setup for terraform.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli
# # Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "=3.0.0"
      version = "=2.97.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resources"
  location = "East Us"
  tags = {
    environment = "dev"
  }
}
# for billing, etc. the tags help to identify the resource object

# Virtual network
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "mtc-vn" {
  name                = "mtc-network"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  # you could use the actual name "mtc-resources" here but it would be very hard if 
  # that name needs to change. Then each occurrance of its usage would need to be changed.
  # DO not do this. Always use this dot syntax to refer to resources. By referencing we also create
  # dependency. The resrouce group cannot be destroyed until the virtual network that references it is destroyed
  # in this way there is a graceful termination and destruction of resources in the proper order.
  # this virtual network group is DEPENDENT on the resource group above.
  location      = azurerm_resource_group.mtc-rg.location
  address_space = ["10.123.0.0/16"]
  # note that this is CIDR block in AWS terminology and is a list []
  # so multiple subnets can be listed here.

  tags = {
    environment = "dev"
  }
}