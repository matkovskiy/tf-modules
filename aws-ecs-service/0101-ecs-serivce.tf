resource "aws_ecs_service" "main" {
  name                               = var.service_name == "" ? module.label.id : var.service_name
  cluster                            = var.cluster_id
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  iam_role                           = var.iam_role != "" ? var.iam_role : null

  dynamic "service_registries" {
    for_each = var.ecs_service_registries
    content {
      registry_arn    = service_registries.value.registry_arn
      # port            = lookup(service_registries.value, "port", null)
      container_port  = lookup(service_registries.value, "container_port", null)
      container_name  = lookup(service_registries.value, "container_name", null)
    }
  }



  dynamic "load_balancer" {
    for_each = var.ecs_load_balancers
    content {
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
    }
  }

  dynamic "network_configuration" {
    for_each = var.network_configuration
    content {
      subnets     = [lookup(network_configuration.value, "subnets", null)]
      security_groups  = [lookup(network_configuration.value, "security_groups", null)]
      assign_public_ip   = lookup(network_configuration.value, "assign_public_ip", null)
    }
  }



  health_check_grace_period_seconds = var.load_balancer_enable == true ? var.health_check_grace_period_seconds : 0
}
