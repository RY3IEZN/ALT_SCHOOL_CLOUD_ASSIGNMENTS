# ---dev/variables.tf---

# volume size of the instance
variable "volume_size" {
  default = 30
}

# instance size
variable "instance_type" {
  default = "t2.micro"
}
