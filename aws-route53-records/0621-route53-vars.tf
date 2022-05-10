variable "route53_records" {
  type = list(object({
    name    = string
    zone_id = string
    type    = string
    ttl     = number
    records = list(string)
  }))
  description = "List of route53 records"
}