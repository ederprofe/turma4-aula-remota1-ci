# Configuração do provider Azure
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

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "SenacTFResourceGroup"
  location = "EastUS2"
}

# Service Plan para Function
resource "azurerm_service_plan" "plan" {
  name                = "azure-functions-senaclab-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

# Storage Account para Function
resource "azurerm_storage_account" "storage" {
  name                     = "senaclabstorageacct"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Function App (Linux) com Python 3.10 e Always On
resource "azurerm_linux_function_app" "function_app" {
  name                       = "senaclabazurefunction"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key

  site_config {
    always_on = true
    application_stack {
      python_version = "3.10"
    }
  }
}
