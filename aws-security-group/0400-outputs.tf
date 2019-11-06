output "id" {
  value = join("", aws_security_group.main.*.id)
  description = "ID of security group"
}
