
resource "aws_key_pair" "default" {
  for_each   = var.keys_map
  key_name   = each.key
  public_key = each.value
  tags       = module.this.tags
}