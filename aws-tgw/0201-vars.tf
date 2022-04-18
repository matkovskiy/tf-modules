variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the application"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ \"1\")"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}

variable "description" {
  type        = string
  description = "Description for TGW "
}

variable "amazon_side_asn" {
  type        = number
  description = "(Optional) Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512"
  default     = 64512
}

variable "auto_accept_shared_attachments" {
  type        = string
  default     = "disable"
  description = "(Optional) Whether resource attachment requests are automatically accepted. Valid values: disable, enable. Default value: disable."
}

variable "default_route_table_association" {
  type        = string
  default     = "enable"
  description = "(Optional) Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. Default value: enable."
}

variable "default_route_table_propagation" {
  type        = string
  default     = "enable"
  description = "(Optional) Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. Default value: enable."
}

variable "dns_support" {
  type        = string
  default     = "enable"
  description = "(Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable."
}

variable "vpn_ecmp_support" {
  type        = string
  default     = "enable"
  description = "(Optional) Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable. Default value: enable."
}