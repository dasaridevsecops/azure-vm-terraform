terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
}
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "example" {
  name     = "example-resourcesaa"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacctaa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

