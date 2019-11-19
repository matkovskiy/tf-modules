
module "label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  tags       = var.tags
}
