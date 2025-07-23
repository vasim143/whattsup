variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use"
  type        = string
}
