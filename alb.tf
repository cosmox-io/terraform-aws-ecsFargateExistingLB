# alb.tf

# resource "aws_alb" "main" {
#   name            = var.aws_alb_name
#   subnets         = aws_subnet.public.*.id
#   security_groups = [aws_security_group.lb.id]
# }

resource "aws_alb_target_group" "app" {
  name        = var.aws_alb_tg_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
# resource "aws_alb_listener" "front_end" {
#   load_balancer_arn = var.lb_arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = var.certificate_arn

#   default_action {
#     target_group_arn = aws_alb_target_group.app.id
#     type             = "forward"
#   }
# }