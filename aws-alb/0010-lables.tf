module "default_label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}


module "default_target_group_label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  attributes = concat(var.attributes, ["default"])
  delimiter  = var.delimiter
  name       = "TG-${var.name}"
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}
