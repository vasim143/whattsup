variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "launch_instance" {
  type        = bool
  description = "Condition to launch EC2"
  default     = true
}
