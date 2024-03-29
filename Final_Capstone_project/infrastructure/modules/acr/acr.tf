# ---acr/acr.tf---

resource "azurerm_container_registry" "capstone_acr" {
  name                = "unekuscapstonesregistry"
  resource_group_name = var.rg_name
  location            = var.rg_location
  sku                 = "Basic"
  admin_enabled       = true

  public_network_access_enabled = true
}
