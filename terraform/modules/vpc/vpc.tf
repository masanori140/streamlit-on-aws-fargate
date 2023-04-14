module "vpc" {
  source     = "../../resources/vpc/vpc"
  cidr_block = "10.0.0.0/16"
  tags       = var.tags
  vpc_name   = "${var.tags.service}-${var.tags.env}-vpc"
}

module "internet_gateway" {
  source                = "../../resources/vpc/internet_gateway"
  internet_gateway_name = "${var.tags.service}-${var.tags.env}-igw"
  tags                  = var.tags
  vpc_id                = module.vpc.vpc.id
}

module "public_subnet" {
  source = "../../resources/vpc/subnet"
  subnets = [
    {
      availability_zone = data.aws_availability_zones.this.names[0]
      cidr_block        = "10.0.0.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[0]}",
    },
    {
      availability_zone = data.aws_availability_zones.this.names[1]
      cidr_block        = "10.0.1.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pub-${data.aws_availability_zones.this.names[1]}",
    },
  ]
  tags   = var.tags
  vpc_id = module.vpc.vpc.id
}

module "private_subnet" {
  source = "../../resources/vpc/subnet"
  subnets = [
    {
      availability_zone = data.aws_availability_zones.this.names[0]
      cidr_block        = "10.0.10.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pri-${data.aws_availability_zones.this.names[0]}",
    },
    {
      availability_zone = data.aws_availability_zones.this.names[1]
      cidr_block        = "10.0.11.0/24"
      name              = "${var.tags.service}-${var.tags.env}-pri-${data.aws_availability_zones.this.names[1]}",
    },
  ]
  tags   = var.tags
  vpc_id = module.vpc.vpc.id
}

module "nat_gateway" {
  source = "../../resources/vpc/nat_gateway"
  nat_gateways = [
    {
      name      = "${var.tags.service}-${var.tags.env}-ngw-${data.aws_availability_zones.this.names[0]}"
      subnet_id = module.public_subnet.subnet.0.id
    },
    {
      name      = "${var.tags.service}-${var.tags.env}-ngw-${data.aws_availability_zones.this.names[1]}"
      subnet_id = module.public_subnet.subnet.1.id
    },
  ]
  tags = var.tags
}

module "public_route_table" {
  source           = "../../resources/vpc/route_table"
  route_table_name = "${var.tags.service}-${var.tags.env}-public"
  subnet_ids       = module.public_subnet.subnet.*.id
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway.id
    }
  ]
}

module "private_route_table_1a" {
  source           = "../../resources/vpc/route_table"
  route_table_name = "${var.tags.service}-${var.tags.env}-pri-${data.aws_availability_zones.this.names[0]}"
  subnet_ids       = [module.private_subnet.subnet.0.id]
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
  route = [
    {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = module.nat_gateway.nat_gateway.0.id
    }
  ]
}

module "private_route_table_1c" {
  source           = "../../resources/vpc/route_table"
  route_table_name = "${var.tags.service}-${var.tags.env}-pri-${data.aws_availability_zones.this.names[1]}"
  subnet_ids       = [module.private_subnet.subnet.1.id]
  tags             = var.tags
  vpc_id           = module.vpc.vpc.id
  route = [
    {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = module.nat_gateway.nat_gateway.1.id
    }
  ]
}
