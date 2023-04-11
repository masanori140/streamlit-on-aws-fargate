output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.public_subnet.subnet.*.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.private_subnet.subnet.*.id
}
