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

module "networking" {
  source      = "./modules/networking"
  rg_location = "uk south"
  rg_name     = "capstone_rg"
  depends_on  = [module.resource_group]
}

module "aks" {
  source             = "./modules/aks"
  rg_location        = "UK South"
  rg_name            = "capstone_rg"
  capstone_subnet_id = module.networking.capstone_subnet_id
}
