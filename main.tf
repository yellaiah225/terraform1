provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

# Reference existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Create Virtual Network
resource "azurerm_virtual_network" "my_vnet" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  address_space       = var.vnet_address_space

  tags = {
    environment = var.environment
  }
}

# Create Subnets
resource "azurerm_subnet" "my_subnet1" {
  name                 = "subnet-1"
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "my_subnet2" {
  name                 = "subnet-2"
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}


