output "vpc_id" {
  description = "ID of the HUB VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the HUB VPC."
  value       = aws_vpc.this.cidr_block
}
