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

# Create Subnet
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
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.vm_name}-pip"
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  allocation_method   = "Dynamic"     # REQUIRED for Standard SKU
  sku                 = "Basic"   # Explicitly set Standard

  tags = {
    environment = var.environment
  }
}


# -------------------------
# Network Interface
# -------------------------
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
}

# -------------------------
# Linux Virtual Machine
# -------------------------
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = var.environment
  }
}
