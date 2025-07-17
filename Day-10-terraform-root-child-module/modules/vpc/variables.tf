variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_blocks" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
