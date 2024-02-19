output "capstone_subnet_id" {
  value = azurerm_subnet.capstone_subnet.id
}

output "capstone_network" {
  value = azurerm_virtual_network.capstone_network.name
}
