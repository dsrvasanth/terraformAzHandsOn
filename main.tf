terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  cloud {
    organization = "vrterracloud"
    workspaces {
      name = "azure-handson"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "handsonrg" {
  name     = "813-698520f3-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source              = "app.terraform.io/vrterracloud/securestorage/azurerm"
  version             = "1.0.0"
  location            = azurerm_resource_group.handsonrg.location
  resource_group_name = azurerm_resource_group.handsonrg.name
  name                = "axterrahandsonjul09"
}
