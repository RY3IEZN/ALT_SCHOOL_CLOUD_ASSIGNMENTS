# ---staging/main.tf---

module "compute" {
  source          = "../modules/compute"
  public_key_path = "~/.ssh/k3key.pub"
  volume_size     = var.volume_size
  public_subnet   = module.networking.public_subnet
  public_sg       = module.networking.public_sg
  user_data       = file("../userdata.tpl")
  enviroment      = "staging"
  instance_type   = var.instance_type
}

module "networking" {
  source      = "../modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.4.0/24"
  enviroment  = "staging"
}
