# ---rg/outputs.tf---

output "rg_name" {
  value = azurerm_resource_group.capstone_rg.name
}

output "rg_location" {
  value = azurerm_resource_group.capstone_rg.location
}
