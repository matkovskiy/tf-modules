
variable "keys_map" {
  type        = map(string)
  description = "Map of Name and keys of SSH public key"
}



# variable "key_name" {
#   type        = string
#   default     = null
#   description = "Name of SSH public key"
# }

# variable "ssh_public_key" {
#   type        = string
#   description = "SSH public key"
#   default     = null
# }