# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "myapp_log_group" {
  name              = "/ecs/${var.log_group_name}"
  retention_in_days = 30

  tags = {
    Name = "ecs-production-${var.log_group_name}"
  }
}

resource "aws_cloudwatch_log_stream" "myapp_log_stream" {
  name           = "ecs_log_stream_${var.log_group_name}"
  log_group_name = aws_cloudwatch_log_group.myapp_log_group.name
}