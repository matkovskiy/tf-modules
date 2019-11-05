locals {
  public_count              = var.enabled && var.type == "public" ? length(var.availability_zones) : 0
  public_nat_gateways_count = var.enabled && var.type == "public" && var.nat_gateway_enabled ? length(var.availability_zones) : 0
}

module "public_label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git?ref=tags/v0.0.1"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  tags       = var.tags
  attributes = compact(concat(var.attributes, ["public"]))
  enabled    = var.enabled
}

resource "aws_subnet" "public" {
  count             = local.public_count
  vpc_id            = var.vpc_id
  availability_zone = element(var.availability_zones, count.index)
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.max_subnets, 2)), count.index)

  tags = merge(
    module.public_label.tags,
    {
      "Name" = "${module.public_label.name}${var.delimiter}${element(var.availability_zones, count.index)}"
      "AZ"   = element(var.availability_zones, count.index)
      "Type" = var.type
    },
  )
}

resource "aws_eip" "public" {
  count = local.public_nat_gateways_count
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}
