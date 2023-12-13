# ---root/variable.tf---

variable "enviroment" {
  default     = ""
  description = "the enviroment name"
  type        = string
}

variable "volume_size" {
  default = 30
}

variable "instance_type" {
  default = "t2.micro"
}
