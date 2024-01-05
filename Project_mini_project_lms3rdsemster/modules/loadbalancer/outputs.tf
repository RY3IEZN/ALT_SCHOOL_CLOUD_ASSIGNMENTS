# ---loadbalancer/outputs.tf---
output "loadbalancer_dns_name" {
  value = aws_lb.nicks_alb.dns_name
}

output "loadbalancer_zone_id" {
  value = aws_lb.nicks_alb.zone_id
}
