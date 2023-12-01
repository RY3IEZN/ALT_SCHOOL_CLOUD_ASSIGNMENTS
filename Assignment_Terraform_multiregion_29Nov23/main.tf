# ---root/main.tf---

module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.2.0/24"
}

module "networking2" {
  source      = "./modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.2.0/24"
  providers = {
    aws = aws.frankfurt
  }
}

module "compute" {
  source          = "./modules/compute"
  public_key_path = "~/.ssh/k3key.pub"
  volume_size     = 30
  public_subnet   = module.networking.public_subnet
  public_sg       = module.networking.public_sg
}

module "compute2" {
  source          = "./modules/compute"
  public_key_path = "~/.ssh/k3key.pub"
  volume_size     = 30
  public_subnet   = module.networking.public_subnet
  public_sg       = module.networking.public_sg
  providers = {
    aws = aws.frankfurt
  }
}
