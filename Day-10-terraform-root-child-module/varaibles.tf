variable "ami_id" {
  default = "ami-0150ccaf51ab55a51"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_name" {
  description = "Database name for RDS"
  type        = string
  default     = "akram-rds"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "admin12345"
}
