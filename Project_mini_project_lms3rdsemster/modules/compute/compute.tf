# ---compute/compute.tf---

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
  key_name = "helloworld"

  user_data = var.user_data

  provisioner "local-exec" {
    command = "echo '${self.public_ip} ansible_user=ubuntu' >> inventory"
  }

  tags = {
    nicks = "ec2"
  }
}

resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
  depends_on      = [aws_instance.instance]
}

# Run Ansible playbook only once after all instances are created
resource "null_resource" "ansible_provisioner" {
  provisioner "local-exec" {
    command = "ansible -i inventory webserverplaybook.yaml"
  }

  depends_on = [time_sleep.wait_10_seconds, aws_instance.instance]
}
