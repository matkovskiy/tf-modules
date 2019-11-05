
resource "aws_nat_gateway" "public" {
  count         = local.public_nat_gateways_count
  allocation_id = element(aws_eip.public.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  depends_on    = [aws_subnet.public]

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    module.public_label.tags,
    {
      "Name" = "${var.nat_name}${var.delimiter}${element(var.availability_zones, count.index)}"
      "AZ"   = element(var.availability_zones, count.index)
      "Type" = var.type
    },
  )
}

# Dummy list of NAT Gateway IDs to use in the outputs for private subnets and when `nat_gateway_enabled=false` for public subnets
# Needed due to Terraform limitation of not allowing using conditionals with maps and lists
locals {
  dummy_az_ngw_ids = slice(
    [
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
      "0",
    ],
    0,
    length(var.availability_zones),
  )
}
