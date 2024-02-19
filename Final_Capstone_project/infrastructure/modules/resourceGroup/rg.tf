# ---rg/rg.tf---


# create resource group
resource "azurerm_resource_group" "capstone_rg" {
  name     = var.rg_name
  location = var.rg_location

  tags = {
    uneku = "capstone"
  }
}
