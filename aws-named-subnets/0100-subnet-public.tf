locals {
  public_count = var.enabled && var.type == "public" ? length(var.subnet_names) : 0
  ngw_count    = var.enabled && var.type == "public" && var.nat_enabled ? 1 : 0
}

module "public_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.15.0"
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
  availability_zone = var.availability_zone
  cidr_block        = cidrsubnet(var.cidr_block, ceil(log(var.max_subnets, 2)), count.index)

  tags = {
    "Name"      = "${module.public_label.id}${var.delimiter}${element(var.subnet_names, count.index)}"
    "Stage"     = module.public_label.stage
    "Namespace" = module.public_label.namespace
    "Named"     = var.subnet_names[count.index]
    "Type"      = var.type
  }
}

resource "aws_eip" "default" {
  count = local.ngw_count
  vpc   = "true"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "default" {
  count         = local.ngw_count
  allocation_id = join("", aws_eip.default.*.id)
  subnet_id     = aws_subnet.public.*.id[0]
  tags          = module.public_label.tags

  lifecycle {
    create_before_destroy = true
  }
}