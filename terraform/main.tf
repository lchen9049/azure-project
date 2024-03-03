# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "myTFResourceGroup"
  location = "eastus2"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "tf-appserviceplan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "tf-web-app "
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
}
