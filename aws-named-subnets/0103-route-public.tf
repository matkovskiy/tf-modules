
resource "aws_route_table" "public" {
  count  = local.public_count
  vpc_id = var.vpc_id

  tags = {
    "Name"      = "${module.public_label.id}${var.delimiter}${element(var.subnet_names, count.index)}"
    "Stage"     = module.public_label.stage
    "Namespace" = module.public_label.namespace
  }
}

resource "aws_route" "public" {
  count                  = local.public_count
  route_table_id         = aws_route_table.public.*.id[count.index]
  gateway_id             = var.igw_id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  count          = local.public_count
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.*.id[count.index]
}