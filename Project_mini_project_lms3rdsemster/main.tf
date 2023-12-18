#  ---root/main.tf---

module "networking" {
  source         = "./modules/networking"
  vpc_cidr       = "192.168.0.0/16"
  public_subnet  = "192.168.2.0/24"
  public_subnet2 = "192.168.4.0/24"
}
