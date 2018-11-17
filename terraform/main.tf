provider "aws" {
  region = "${var.region}"
}

module "network" {
  source = "modules/network"
  environment = "${var.environment}"
  vpc_cidr = "${var.vpc_cidr}"
  private_subnet_cidrs = "${var.private_subnet_cidrs}"
  public_subnet_cidrs = "${var.public_subnet_cidrs}"
  availibility_zones = "${var.availibility_zones}"
}

module "ecs" {
  source = "modules/ecs"
  repo_owner = "${var.repo_owner}"
  repo_name = "${var.repo_name}"
  github_oauth_token = "${var.github_oauth_token}"
  vpc_cidr = "${var.vpc_cidr}"
  ami_image = "${var.ami_image}"
  ecs_key = "${var.ecs_key}"
  instance_type = "${var.instance_type}"
  private_subnet_ids = "${module.network.private_subnet_ids}"
  public_subnet_ids = "${module.network.public_subnet_ids}"
  vpc_id = "${module.network.vpc_id}"
}

output "url" {
  description = "flask app url"
  value       = "${module.ecs.flask_url}"
}

variable "region" {}
variable "vpc_cidr" {}
variable "environment" {}
variable "private_subnet_cidrs" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "availibility_zones" {
  type = "list"
}
variable "ami_image" {
  
}
variable "ecs_key" {
  
}

variable "repo_owner" {
  
}

variable "repo_name" {
  
}

variable "github_oauth_token" {
  
}
variable "instance_type" {
  
}
