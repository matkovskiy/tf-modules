module "label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  enabled    = var.enabled
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

module "final_snapshot_label" {
  source     = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  enabled    = var.enabled
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = compact(concat(var.attributes, ["final", "snapshot"]))
  tags       = var.tags
}
