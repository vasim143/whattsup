provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = "akram vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1e"]
}

module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.subnet_ids
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  ec2_name         = "akram ec2"
}

module "rds" {
  source     = "./modules/rds"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  db_name    = var.db_name
  username   = var.db_username
  password   = var.db_password
  rds_name   = "akram rds"
}

