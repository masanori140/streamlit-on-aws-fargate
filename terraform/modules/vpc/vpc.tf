# --------------------------------------------------------------------------------
# Amazon VPC モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
# --------------------------------------------------------------------------------

module "vpc" {
  source     = "git::https://github.com/norishio2022/terraform-aws-resources.git//vpc"
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
  vpc_name   = "${var.tags.service}-${var.tags.env}-vpc"
}

# --------------------------------------------------------------------------------
# Amazon VPC Internet Gateway モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# --------------------------------------------------------------------------------

module "internet_gateway" {
  source                = "git::https://github.com/norishio2022/terraform-aws-resources.git//internet_gateway"
  internet_gateway_name = "${var.tags.service}-${var.tags.env}-igw"
  tags                  = var.tags
  vpc_id                = module.vpc.vpc.id
}

# --------------------------------------------------------------------------------
# Amazon VPC Public Subnet モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# --------------------------------------------------------------------------------

module "public_subnet" {
  source      = "git::https://github.com/norishio2022/terraform-aws-resources.git//subnet"
  cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24"]
  subnet      = "public"
  tags        = var.tags
  vpc_id      = module.vpc.vpc.id
}

# --------------------------------------------------------------------------------
# Amazon VPC Private Subnet モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# --------------------------------------------------------------------------------

module "private_subnet" {
  source      = "git::https://github.com/norishio2022/terraform-aws-resources.git//subnet"
  cidr_blocks = ["10.0.10.0/24", "10.0.11.0/24"]
  subnet      = "private"
  tags        = var.tags
  vpc_id      = module.vpc.vpc.id
}

# --------------------------------------------------------------------------------
# Amazon VPC NAT Gateway モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
# --------------------------------------------------------------------------------

module "nat_gateway" {
  source     = "git::https://github.com/norishio2022/terraform-aws-resources.git//nat_gateway"
  subnet_ids = module.public_subnet.subnet.*.id
  tags       = var.tags
}

# --------------------------------------------------------------------------------
# Amazon VPC Public Route Table モジュール
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# --------------------------------------------------------------------------------

module "public_route_table" {
  source     = "git::https://github.com/norishio2022/terraform-aws-resources.git//route_table"
  subnet     = "public"
  subnet_ids = module.public_subnet.subnet.*.id
  tags       = var.tags
  vpc_id     = module.vpc.vpc.id
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway.id
    }
  ]
}

# --------------------------------------------------------------------------------
# Amazon VPC Private Route Table モジュール（）
# @see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# --------------------------------------------------------------------------------

module "private_route_table" {
  source          = "git::https://github.com/norishio2022/terraform-aws-resources.git//route_table"
  nat_gateway_ids = module.nat_gateway.nat_gateway.*.id
  subnet          = "private"
  subnet_ids      = module.private_subnet.subnet.*.id
  tags            = var.tags
  vpc_id          = module.vpc.vpc.id
  route = [
    {
      cidr_block = "0.0.0.0/0"
    }
  ]
}
