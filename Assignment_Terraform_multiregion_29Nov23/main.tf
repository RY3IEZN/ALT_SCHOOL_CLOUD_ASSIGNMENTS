# ---root/main.tf---

module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.2.0/24"
  enviroment  = var.enviroment == "" ? "root" : var.enviroment
}

module "compute" {
  source          = "./modules/compute"
  public_key_path = "~/.ssh/k3key.pub"
  volume_size     = var.volume_size
  public_subnet   = module.networking.public_subnet
  public_sg       = module.networking.public_sg
  user_data       = file("userdata.tpl")
  enviroment      = var.enviroment == "" ? "root" : var.enviroment
  instance_type   = var.instance_type
}

