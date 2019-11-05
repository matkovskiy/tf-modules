resource "aws_internet_gateway" "gw" {
  count = var.create_igw == true ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = var.igw_tags
}
