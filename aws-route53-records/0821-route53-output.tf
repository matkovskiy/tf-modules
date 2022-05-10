output "records" {
  value = toset([
    for default in aws_route53_record.default : default.fqdn
  ])
}
