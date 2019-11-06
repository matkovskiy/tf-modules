
module "label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
namespace  = var.namespace
name       = var.name
stage      = var.stage
delimiter  = var.delimiter
attributes = var.attributes
tags       = var.tags
enabled    = var.enabled
}
