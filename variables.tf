variable "aws_region" {
  description = "The AWS region things are created in"
}

variable "ecs_cluster_name" {
  type = string
}

variable "task_definition_name" {
  type = string
}

variable "log_group_name" {
  type = string
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "fasalWebAppECSTaskExeRole"
}

variable "cidr_block" {
  type = string
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
}

variable "lb_arn" {
  type = string
}

variable "alb_dns_name" {
  type = string
}

variable "alb_zone_id" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}

# variable "aws_alb_name" {
#   type = string
# }

# variable "load_balancer_sg_name" {
#   type = string
# }

variable "ecs_task_sg" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "aws_alb_tg_name" {
  type = string
}

variable "cloudwatch_asg_up_alarm_name" {
  type = string
}

variable "cloudwatch_asg_down_alarm_name" {
  type = string
}

variable "scale_up_policy_name" {
  type = string
}

variable "scale_down_policy_name" {
  type = string
}

variable "autoscaling_target_min_capacity" {
  type = number
}

variable "autoscaling_target_max_capacity" {
  type = number
}

variable "health_check_path" {
  default = "/"
}

variable "cpu_utilization_threshold_high" {
  type = string
}

variable "cpu_utilization_threshold_low" {
  type = string
}

variable "template_path" {
  type = string
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}
variable "mongo_url" {
  description = "MongoDB URL"
  type        = string
}

variable "root_url" {
  description = "Root URL for meteor app"
  type        = string
}

variable "settings_param" {
  description = "Settings json"
  type        = string
}

variable "mail_url" {
  description = "Mail server URL"
}

variable "expose_port" {
  description = "Container port to expose"
  default     = "80"
}

variable "route53_zone_id" {
  type = string
}

variable "subdomain_name" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "execution_role_arn" {
  type    = string
  default = "arn:aws:iam::798504583610:role/ecs_ssm_full_access"
}