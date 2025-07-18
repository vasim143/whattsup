
variable "allowed_ports" {
  type    = list(number)
  default = [
    22, 80, 443, 8080, 3000, 3306, 5000,
    5432, 27017, 9200, 6379, 21, 25,
    3389, 1024, 4000, 8888
  ]
}

resource "aws_security_group" "multi_port_sg" {
  name        = "multi-port-sg"
  description = "Security group allowing multiple ports from same CIDR"
  vpc_id      = "vpc-0dc5998ccb78b3fb3"
}

# Convert list to map with string keys for for_each
locals {
  port_map = {
    for port in var.allowed_ports : tostring(port) => port
  }
}

resource "aws_security_group_rule" "allow_ingress_rules" {
  for_each = local.port_map

  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.multi_port_sg.id
  description       = "Allow TCP port ${each.value} from anywhere"
}

output "security_group_id" {
  value = aws_security_group.multi_port_sg.id
}
