# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.3.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "myTFResourceGroup"
  location = "westus3"
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "tf-appserviceplan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "app_service" {
  name                = "tfWebAppTest03032024"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  https_only          = true
  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }
}

resource "azurerm_app_service_source_control" "source_control" {
  app_id                 = azurerm_linux_web_app.app_service.id
  repo_url               = "https://github.com/lchen9049/azure-project.git"
  branch                 = "test"
  use_manual_integration = true
}