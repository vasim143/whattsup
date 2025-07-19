variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "user_data" {
  description = "User data script content"
  type        = string
}
