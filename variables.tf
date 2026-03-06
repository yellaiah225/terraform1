# Terraform Variables for Azure VM Configuration

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location where the VM will be created"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the image to be used for the VM"
  type        = string
}

variable "image_offer" {
  description = "The offer of the image to be used for the VM"
  type        = string
}

variable "image_sku" {
  description = "The SKU of the image to be used for the VM"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
}

variable "size" {
  description = "The size of the VM"
  type        = string
}

variable "network_interface_ids" {
  description = "The network interface IDs for the VM"
  type        = list(string)
}
