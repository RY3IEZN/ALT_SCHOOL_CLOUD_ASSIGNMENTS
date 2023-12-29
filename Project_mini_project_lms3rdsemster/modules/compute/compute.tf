# ---compute/compute.tf---

# create the key
resource "aws_key_pair" "uneku_key" {
  key_name   = "uneku_key"
  public_key = file(var.public_key_path)

  tags = {
    nicks = "keys"
  }
}

# create the instance
resource "aws_instance" "instance" {
  count                  = 3
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size = 30
  }
  key_name = aws_key_pair.uneku_key.id

  user_data = var.user_data

  provisioner "local-exec" {
    command = "echo '${self.public_ip} ansible_user=ubuntu' >> inventory"
  }

  tags = {
    nicks = "ec2"
  }
}

# resource "null_resource" "name" {
#   provisioner "local-exec" {
#     command = ""
#   }
# }
