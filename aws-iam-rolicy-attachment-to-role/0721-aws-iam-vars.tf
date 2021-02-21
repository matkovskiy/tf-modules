variable "role_name" {
  type        = string
  description = "The name for role"
}

variable "role_path" {
  type        = string
  default     = "/"
  description = "The path for role"
}

variable "policy_arn" {
  type        = string
  description = "The ARN of policy which will be attached to role"
}

variable "principals_type" {
  type        = string
  default     = "Service"
  description = "The principals type"
}

variable "principals_identifiers" {
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
  description = "The list of identifiers"
}

variable "instance_profile_enable" {
  type        = bool
  default     = true
  description = "Create aws_iam_instance_profile"
}