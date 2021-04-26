# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = var.ecs_cluster_name
}

data "template_file" "fasal_web_app_production" {
  template = file(var.template_path)
  vars = {
    task_definition_name = var.task_definition_name
    log_group_name       = var.log_group_name
    app_image            = var.app_image
    app_port             = var.app_port
    fargate_cpu          = var.fargate_cpu
    fargate_memory       = var.fargate_memory
    aws_region           = var.aws_region
    root_url             = var.root_url
    mongo_url            = var.mongo_url
    mail_url             = var.mail_url
    expose_port          = var.expose_port
    settings_param       = var.settings_param
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.task_definition_name
  execution_role_arn       = var.execution_role_arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.fasal_web_app_production.rendered
}

resource "aws_ecs_service" "main" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = var.task_definition_name
    container_port   = var.app_port
  }

  depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role]
}