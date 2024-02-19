output "acr_login_server" {
  value = azurerm_container_registry.capstone_acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.capstone_acr.admin_username
}

output "acr_id" {
  value = azurerm_container_registry.capstone_acr.id
}
