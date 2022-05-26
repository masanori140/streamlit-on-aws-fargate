# --------------------------------------------------------------------------------
# Amazon VPC モジュール アウトプット定義
# --------------------------------------------------------------------------------

output "vpc_id" {
  value = module.vpc.vpc.id
}

output "public_subnet_ids" {
  value = module.public_subnet.subnet.*.id
}

output "private_subnet_ids" {
  value = module.private_subnet.subnet.*.id
}
