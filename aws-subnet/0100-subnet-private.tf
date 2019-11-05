locals {
  private_count       = var.enabled == "true" && var.type == "private" ? length(var.availability_zones) : 0
  private_route_count = length(var.az_ngw_ids)
}

module "private_label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git?ref=tags/v0.0.1"
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
  availability_zone = var.availability_zones[count.index]
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.max_subnets, 2)), count.index)

  tags = merge(
    module.private_label.tags,
    {
      "Name" = "${module.private_label.name}${var.delimiter}${element(var.availability_zones, count.index)}"
      "AZ"   = var.availability_zones[count.index]
      "Type" = var.type
    },
  )
}
