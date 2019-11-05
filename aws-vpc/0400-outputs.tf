output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the AWS VPC"
}


output "igw_id" {
  value       = aws_internet_gateway.gw.*.id
  description = "The ID of the AWS IGW"
}
