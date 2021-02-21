output "bucket_domain_name" {
  value       = join("", aws_s3_bucket.default.*.bucket_domain_name)
  description = "FQDN of bucket"
}

output "bucket_id" {
  value       = join("", aws_s3_bucket.default.*.id)
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       = join("", aws_s3_bucket.default.*.arn)
  description = "Bucket ARN"
}

output "prefix" {
  value       = var.lifecycle_prefix
  description = "Prefix configured for lifecycle rules"
}

output "enabled" {
  value       = module.this.enabled
  description = "Is module enabled"
}