# ---root/main.tf---

module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.2.0/24"
  enviroment  = "outside"
}

module "networking2" {
  source      = "./modules/networking"
  vpc_cidr    = "192.168.0.0/16"
  public_cidr = "192.168.2.0/24"
  enviroment  = "outside"
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
  user_data       = file("userdata.tpl")
  enviroment      = "lol"
  instance_type   = "t2.micro"
}

module "compute2" {
  source          = "./modules/compute"
  instance_type   = "t2.micro"
  enviroment      = "lol"
  public_key_path = "~/.ssh/k3key.pub"
  volume_size     = 30
  public_subnet   = module.networking.public_subnet
  public_sg       = module.networking.public_sg
  user_data       = file("userdata.tpl")

  providers = {
    aws = aws.frankfurt
  }
}
