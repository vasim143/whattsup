variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance"
  type        = list(string)
}

variable "allocated_storage" {
  description = "The amount of storage allocated to the RDS instance"
  type        = number
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
