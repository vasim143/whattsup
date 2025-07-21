variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "allowed_ingress_ports" {
  description = "List of allowed ingress ports"
  type        = list(number)
}

variable "allowed_ingress_cidrs" {
  description = "CIDR blocks allowed to ingress"
  type        = list(string)
}


