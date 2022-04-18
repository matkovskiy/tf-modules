output "id" {
  value = [
    for k in aws_key_pair.default :  k.id
  ]
  description = "The key pair name."
}

output "keys_arns" {
  value = {
    for k, default in aws_key_pair.default : k => default.arn
  }
  description = "Map of the keys pair ARN."
}

output "keys_pair_id" {
  value = {
    for k, default in aws_key_pair.default : k => default.key_pair_id
  }
  description = "Map of the keys pair ID."
}

output "fingerprint" {
  value = {
    for k, default in aws_key_pair.default : k => default.fingerprint
  }
  description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
}

output "tags_all" {
  value = {
    for k, default in aws_key_pair.default : k => default.tags_all
  }
  description = "A map of tags assigned to the resource, including those inherited from the provider"
}