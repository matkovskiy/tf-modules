module "security_group" {
  source = "git::https://github.com/matkovskiy/tf-modules.git//aws-security-group?ref=tags/0.0.36"
  #  version = "0.3.3"

  use_name_prefix = var.security_group_use_name_prefix
  rules           = var.security_group_rules
  description     = var.security_group_description
  vpc_id          = var.vpc_id

  enabled = local.security_group_enabled
  context = module.this.context
}




