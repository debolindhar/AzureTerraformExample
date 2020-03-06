provider "azurerm" {
  version = "~> 1.33.1"
}

resource "azurerm_resource_group" "example" {
  name     = "example-resourcegroup"
  location = "East US"
  tags = {
    environment = "training"
  }
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free"
	size = "F1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service_debolin"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}
