terraform {
  required_version = ">= 1.8.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {}
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region in which to create the VPC."
  type        = string
  default     = "us-east-1"
}

variable "hub_vpc_cidr" {
  description = "IPv4 CIDR block for the HUB VPC."
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.hub_vpc_cidr))
    error_message = "hub_vpc_cidr must be a valid IPv4 CIDR block."
  }
}

module "hub" {
  source = "./modules/hub"

  name       = "HUB-VPC"
  cidr_block = var.hub_vpc_cidr
}

output "hub_vpc_id" {
  description = "ID of the HUB VPC."
  value       = module.hub.vpc_id
}

output "hub_vpc_cidr" {
  description = "CIDR block of the HUB VPC."
  value       = module.hub.vpc_cidr
}
