resource "aws_route_table" "private" {
  count  = local.private_count
  vpc_id = var.vpc_id

  tags = merge(
    module.private_label.tags,
    {
      "Name" = "${module.private_label.id}${var.delimiter}${element(var.availability_zones, count.index)}"
      "AZ"   = element(var.availability_zones, count.index)
      "Type" = var.type
    },
  )
}

resource "aws_route_table_association" "private" {
  count          = local.private_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
  depends_on = [
    aws_subnet.private,
    aws_route_table.private,
  ]
}

resource "aws_route" "default" {
  count = local.private_route_count
  route_table_id = zipmap(
    var.availability_zones,
    matchkeys(
      aws_route_table.private.*.id,
      aws_route_table.private.*.tags.AZ,
      var.availability_zones,
    ),
  )[element(keys(var.az_ngw_ids), count.index)]
  nat_gateway_id         = var.az_ngw_ids[element(keys(var.az_ngw_ids), count.index)]
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.private]
}
