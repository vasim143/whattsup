variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "allowed_ingress_ports" {
  type    = list(number)
  default = [22, 80, 443, 8080]
}

variable "allowed_ingress_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0c94855ba95c71c99" # Ubuntu 20.04 LTS in us-east-1
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "instance_count" {
  default = 1
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_name" {
  default = "mydb"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  default = 20
}

variable "engine" {
  description = "The database engine (mysql, postgres, etc.)"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}



variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs for the RDS instance"
  default     = ["sg-0123456789abcdef0"]  # Replace with your actual SG ID
}
variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}
