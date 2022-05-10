resource "aws_route53_record" "default" {
for_each = {for i, v in var.route53_records:  i => v}
  name     = each.value.name
  zone_id  = each.value.zone_id
  type     = each.value.type
  ttl      = each.value.ttl == "null" ? each.value.ttl : 300
  records  = each.value.records
}