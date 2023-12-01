# ---compute/compute.tf---


# create the key
resource "aws_key_pair" "uneku_key" {
  key_name   = "uneku_key"
  public_key = file(var.public_key_path)

  tags = {
    uneku = "keys-${terraform.workspace}"
  }
}

# create the instance
resource "aws_instance" "instance" {
  count                  = 2
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [var.public_sg]

  root_block_device {
    volume_size = var.volume_size
  }
  key_name = aws_key_pair.uneku_key.id

  user_data = file("userdata.tpl")


  #   provisioner "local-exec" {
  #     command = templatefile("../scp_script.tpl", {
  #       nodeip = self.public_ip
  #     })
  #   }
}
