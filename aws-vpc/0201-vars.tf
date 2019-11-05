variable cidr_block {
  default = ""
}

variable "enable_dns_support" {
  default = ""
}

variable "enable_dns_hostnames" {
  default = ""
}

variable "vpc_tags" {
  type = "map"
  default = {
  }
}

variable "create_igw" {
  type = bool
  default = false
}

variable "igw_tags" {
  type = "map"
  default = {
  }
}
