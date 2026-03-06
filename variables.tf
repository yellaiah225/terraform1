variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The Azure location where the resources will be created"
  type = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type = string
}

variable "environment" {
  description = "The environment for the VM (e.g., dev, test, prod)"
  type = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type = string
}

variable "ssh_public_key" {
  description = "The public SSH key for authentication"
  type = string
}

variable "image_publisher" {
  description = "The publisher of the image to use"
  type = string
}

variable "image_offer" {
  description = "The offer of the image to use"
  type = string
}

variable "image_sku" {
  description = "The SKU of the image to use"
  type = string
}

variable "os_disk_caching" {
  description = "The caching for the OS disk (e.g., None, ReadOnly, ReadWrite)"
  type = string
}