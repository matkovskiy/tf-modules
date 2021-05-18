module "default_sg" {
  source = "git::https://github.com/matkovskiy/tf-modules.git//aws-security-group?ref=tags/0.0.36"
  
  rules   = var.security_group_rules
  vpc_id  = var.vpc_id

  enabled = local.security_group_enabled
  context = module.this.context
}