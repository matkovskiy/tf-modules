
resource "aws_security_group" "main"{
  count      = var.enabled  ? 1 : 0
  vpc_id     = var.vpc_id
  name       = "GN-${module.security-group_label.name}"
  dynamic "egress" {
    for_each = var.security_rule_egress
    content {
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      security_groups  = lookup(egress.value, "security_groups", null)
      from_port       = lookup(egress.value, "from_port", null)
      protocol        = lookup(egress.value, "protocol", null)
      to_port         = lookup(egress.value, "to_port", null)
    }
  }
  dynamic "ingress" {
    for_each = var.security_rule_ingress
    content {
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
      from_port       = lookup(ingress.value, "from_port", null)
      protocol        = lookup(ingress.value, "protocol", null)
      to_port         = lookup(ingress.value, "to_port", null)
    }
  }
  tags       = module.security-group_label.tags
}
