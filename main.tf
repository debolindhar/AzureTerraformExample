provider "azurerm" {
  version = "~> 1.33.1"
}

resource "azurerm_resource_group" "lab1" {
  name     = "terraform-lab1"
  location = "East US"
  tags = {
    environment = "training"
  }
}
