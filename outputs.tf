output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}

output "private_ip_address" {
  value = azurerm_network_interface.example.private_ip_address
}

output "vm_id" {
  value = azurerm_virtual_machine.example.id
}

output "vm_name" {
  value = azurerm_virtual_machine.example.name
}