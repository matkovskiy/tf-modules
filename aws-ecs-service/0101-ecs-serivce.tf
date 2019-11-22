resource "aws_ecs_service" "main" {
  name                               = var.service_name == "" ? module.label.id : var.service_name
  cluster                            = var.cluster_id
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  iam_role                           = var.iam_role != "" ? var.iam_role : null



  dynamic "load_balancer" {
    for_each = var.ecs_load_balancers
    content {
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
    }
  }


  # load_balancer {
  #   target_group_arn = var.load_balancer_enable == true ? var.target_group_arn : ""
  #   container_name   = var.load_balancer_enable == true ? var.container_name : ""
  #   container_port   = var.load_balancer_enable == true ? var.container_port : 0
  # }
  health_check_grace_period_seconds = var.load_balancer_enable == true ? var.health_check_grace_period_seconds : 0
}
