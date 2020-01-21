locals {
  private_count = var.enabled && var.type == "private" ? length(var.subnet_names) : 0
}

module "private_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  tags       = var.tags
  attributes = compact(concat(var.attributes, ["private"]))
  enabled    = var.enabled
}

resource "aws_subnet" "private" {
  count             = local.private_count
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.max_subnets, 2)), count.index)

  tags = {
    "Name"      = "${module.private_label.id}${var.delimiter}${element(var.subnet_names, count.index)}"
    "Stage"     = module.private_label.stage
    "Namespace" = module.private_label.namespace
    "Named"     = var.subnet_names[count.index]
    "Type"      = var.type
  }
}
