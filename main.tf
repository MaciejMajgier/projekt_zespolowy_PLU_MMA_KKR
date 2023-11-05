terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "prjzespolowy"
  location = "North Europe"

}

resource "azurerm_data_factory" "ADF" {
  name                = "adfprjzesp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  global_parameter {
    name = "BCCompany"
    type = "String"
    value = "test"

  }
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqlservprjzesp"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "papiezak2137"
  administrator_login_password = "papiezakGMD"
}

