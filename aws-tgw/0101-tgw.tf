resource "aws_ec2_transit_gateway" "tgw" {

  amazon_side_asn = var.amazon_side_asn
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  description = var.description
  dns_support = var.dns_support
  tags = merge(
  module.default_label.tags,
  {
    "Name" = "${var.name}"
  },
)
}