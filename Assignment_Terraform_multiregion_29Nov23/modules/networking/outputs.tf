output "public_subnet" {
  value = aws_subnet.uneku_public_subnet.id
}

output "public_sg" {
  value = aws_security_group.allow_all.id
}
