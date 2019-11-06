variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = string
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
}

variable "name" {
  type        = string
  description = "Application or solution name"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}


variable "security_rule_egress" {
  description = "Egress network ACL rules"
  # type        = list(map(string))
  default = [
    {
      cidr_blocks   = ["10.0.0.0/24"]
      from_port     = 0
      to_port       = 0
      protocol      = "-1"
    },
  ]
}


variable "security_rule_ingress" {
  description = "Egress network ACL rules"
  # type        = list(map(string))
  default = [
    {
      cidr_blocks     = ["10.10.10.10/32"]
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
    }
  ]
}
