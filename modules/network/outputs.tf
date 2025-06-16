output "vnet_id" {
  description = "ID of the created virtual network."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs."
  value       = { for k, s in azurerm_subnet.this : k => s.id }
}
