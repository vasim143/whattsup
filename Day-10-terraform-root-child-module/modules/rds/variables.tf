variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}


variable "username" {}
variable "password" {}
variable "rds_name" {}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
}
