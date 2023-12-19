resource "aws_lb" "nicks_alb" {
  name               = "nick123abcalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_id, var.public_subnet_id2]
  ip_address_type    = "ipv4"

  tags = {
    nicks = "alb"
  }
}

resource "aws_lb_listener" "nicks_alb_listner" {
  load_balancer_arn = aws_lb.nicks_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nicks_alb_tg.arn
  }
}


resource "aws_lb_target_group" "nicks_alb_tg" {
  name     = "nicksalbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 300
    path                = "/"
    protocol            = "HTTP"
    enabled             = true
    timeout             = 60
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

}


resource "aws_lb_target_group_attachment" "test" {
  count            = length(var.instance_id)
  target_group_arn = aws_lb_target_group.nicks_alb_tg.arn
  target_id        = var.instance_id[count.index]
  port             = 80

}
