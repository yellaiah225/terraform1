# Terraform Configuration for Azure Linux VM

provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "main" {
  name     = "example-resources"
  location = "East US"
}

# Create a Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Create a Subnet
resource "azurerm_subnet" "main" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a Network Interface
resource "azurerm_network_interface" "main" {
  name                = "example-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

# Create a Public IP
resource "azurerm_public_ip" "main" {
  name                = "example-public-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}

# Create a Network Security Group
resource "azurerm_network_security_group" "main" {
  name                = "example-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Create a Network Security Rule
resource "azurerm_network_security_rule" "main" {
  name                        = "example-nsg-rule"
  priority                    = 1000
  access                      = "Allow"
  direction                   = "Inbound"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix      = "*"
  destination_address_prefix   = "*"
  network_security_group_name  = azurerm_network_security_group.main.name
}

# Create a Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "main" {
  name                = "exampleVM"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "P@ssword123"  # Use an output for secret in production
  network_interface_ids = [azurerm_network_interface.main.id]
  os_disk {
    caching              = "ReadWrite"
    create_option       = "FromImage"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}