variable "allocated_storage" {}
variable "engine_version" {}
variable "instance_class" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
