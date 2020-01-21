output "arn" {
  value = aws_ec2_transit_gateway.tgw.arn
  description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
}

output "id" {
  value = aws_ec2_transit_gateway.tgw.id
  description = "EC2 Transit Gateway identifier"
}

output "owner_id" {
  value = aws_ec2_transit_gateway.tgw.owner_id
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
}