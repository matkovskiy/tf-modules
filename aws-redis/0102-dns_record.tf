module "dns" {
  source  = "git::https://github.com/matkovskiy/tf-modules.git//aws-route53-record?ref=tags/0.0.14"
  enabled = var.enabled && var.zone_id != "" ? true : false
  name    = var.dns_subdomain != "" ? var.dns_subdomain : var.name
  ttl     = 60
  zone_id = var.zone_id
  records = var.cluster_mode_enabled ? [join("", aws_elasticache_replication_group.default.*.configuration_endpoint_address)] : [join("", aws_elasticache_replication_group.default.*.primary_endpoint_address)]
}