terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_dns_hostnames = true
}

module "sg" {
  source = "../../modules/sg"

  vpc_id = module.vpc.vpc_id

  allowed_ingress_ports = var.allowed_ingress_ports
  allowed_ingress_cidrs = var.allowed_ingress_cidrs
}

module "ec2" {
  source = "../../modules/ec2"

  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.sg.security_group_id]

  instance_type  = var.instance_type
  ami_id         = var.ami_id
  key_name       = var.key_name
  instance_count = var.instance_count
}

module "rds" {
  source = "../../modules/rds"

  engine                 = var.engine
  engine_version         = var.engine_version
  allocated_storage      = var.allocated_storage
  db_instance_class      = var.db_instance_class
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
}
