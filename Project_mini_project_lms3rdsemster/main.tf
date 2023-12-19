#  ---root/main.tf---

module "networking" {
  source         = "./modules/networking"
  vpc_cidr       = "192.168.0.0/16"
  public_subnet  = "192.168.2.0/24"
  public_subnet2 = "192.168.4.0/24"
}

module "compute" {
  source            = "./modules/compute"
  user_data         = file("userdata.tpl")
  public_key_path   = "~/.ssh/k3key.pub"
  security_group_id = module.networking.security_group_id
  public_subnet_id  = module.networking.public_subnet_id
}

module "loadbanacer" {
  source            = "./modules/loadbalancer"
  public_subnet_id  = module.networking.public_subnet_id
  public_subnet_id2 = module.networking.public_subnet_id2
  security_group_id = module.networking.security_group_id
  vpc_id            = module.networking.vpc_id
  instance_id       = module.compute.ec2_ids
}
