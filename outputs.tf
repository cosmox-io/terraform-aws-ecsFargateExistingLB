# output "alb_hostname" {
#   value = aws_alb.main.dns_name
# }

# output "final_dns" {
#   value = "https://app1.fasal.co"
# }

output "listner_arn" {
  value = aws_alb_listener.front_end.arn
}

output "aws_alb_target_group_arn" {
  value = aws_alb_target_group.app.arn
}