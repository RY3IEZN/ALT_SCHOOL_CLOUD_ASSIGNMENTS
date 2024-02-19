
resource "azurerm_virtual_network" "capstone_network" {
  name                = "capstone-network"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "capstone_subnet" {
  name                 = "capstone_subnet"
  virtual_network_name = azurerm_virtual_network.capstone_network.name
  resource_group_name  = var.rg_name
  address_prefixes     = ["10.1.0.0/22"]
}
