variable "aws_region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_1" {
  description = "Subnet 1 ID"
  type        = string
}

variable "subnet_2" {
  description = "Subnet 2 ID"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "rds_db_name" {
  description = "RDS DB Name"
  type        = string
}

variable "rds_username" {
  description = "RDS Username"
  type        = string
}

variable "rds_password" {
  description = "RDS Password"
  type        = string
}
