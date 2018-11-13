module "vpc" {
  source = "../vpc"

  vpc_cidr        = "${var.vpc_cidr}"
  environment = "${var.environment}"
}

module "private_subnet" {
  source = "../subnet"

  name               = "${var.environment}_private_subnet"
  environment        = "${var.environment}"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.private_subnet_cidrs}"
  availibility_zones = "${var.availibility_zones}"
}

module "public_subnet" {
  source = "../subnet"

  name               = "${var.environment}_public_subnet"
  environment        = "${var.environment}"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.public_subnet_cidrs}"
  availibility_zones = "${var.availibility_zones}"
}

module "nat" {
  source = "../nat_gateway"

  subnet_ids   = "${module.public_subnet.ids}"
}

resource "aws_route" "public_igw_route" {
  route_table_id         = "${module.public_subnet.route_table_id}"
  gateway_id             = "${module.vpc.igw}"
  destination_cidr_block = "${var.destination_cidr_block}"
}


resource "aws_route" "private_nat_route" {
  route_table_id         = "${module.private_subnet.route_table_id}"
  nat_gateway_id         = "${module.nat.id}"
  destination_cidr_block = "${var.destination_cidr_block}"
}
