# ---root/main.tf---

module "resource_group" {
  source      = "./modules/resourceGroup"
  rg_name     = "capstone_rg"
  rg_location = "UK South"
}

module "acr" {
  source      = "./modules/acr"
  rg_name     = "capstone_rg"
  rg_location = "UK South"

}
