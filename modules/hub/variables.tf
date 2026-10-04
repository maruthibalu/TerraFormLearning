variable "name" {
  description = "Name assigned to the HUB VPC."
  type        = string
}

variable "cidr_block" {
  description = "IPv4 CIDR block for the HUB VPC."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.cidr_block))
    error_message = "cidr_block must be a valid IPv4 CIDR block."
  }
}
