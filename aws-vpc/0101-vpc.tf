resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = var.vpc_tags
  enable_dns_support = var.enable_dns_support == true ? true : false
  enable_dns_hostnames  = var.enable_dns_hostnames == true ? true : false
}
