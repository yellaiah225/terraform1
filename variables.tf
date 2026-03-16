variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }
variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
variable "vm_name" {
  description = "Name of the Linux VM"
}

variable "vm_size" {
  description = "VM size"
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for VM"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
}
