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

resource "azurerm_mssql_database" "sqldb" {
  name           = "sqldbprjzesp"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 5
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
}