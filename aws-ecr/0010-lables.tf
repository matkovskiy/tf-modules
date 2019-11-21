module "label" {
  source              = "git::https://github.com/matkovskiy/tf-modules.git//tf-label?ref=tags/v0.0.3"
  enabled             = var.enabled
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  delimiter           = var.delimiter
  attributes          = var.attributes
  tags                = var.tags
  regex_replace_chars = var.regex_replace_chars
}
