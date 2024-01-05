# ---route53/route53.tf---

resource "aws_route53_zone" "zone" {
  name = "meetunekue.online"
}


resource "aws_route53_record" "loadbalancer_record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "terraform-test.meetunekue.online"
  type    = "A"

  alias {
    name                   = var.loadbalancer_dns_name
    zone_id                = var.loadbalancer_zone_id
    evaluate_target_health = true
  }
}
