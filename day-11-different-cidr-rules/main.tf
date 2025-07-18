
variable "port_cidr_map" {
  type = map(object({
    port = number
    cidr = string
  }))
  default = {
    rule1 = {
      port = 22
      cidr = "192.168.1.0/24"
    }
    rule2 = {
      port = 80
      cidr = "10.0.0.0/16"
    }
    rule3 = {
      port = 443
      cidr = "0.0.0.0/0"
    }
    rule4 = {
      port = 8080
      cidr = "172.16.0.0/12"
    }
    rule5 = {
      port = 3306
      cidr = "192.168.10.0/24"
    }
    # 🔁 Add more rules as needed
  }
}

resource "aws_security_group" "multi_sg" {
  name        = "multi-port-diff-cidr-sg"
  description = "SG allowing various ports with different CIDRs"
  vpc_id      = "vpc-0dc5998ccb78b3fb3"
}

resource "aws_security_group_rule" "custom_ingress" {
  for_each = var.port_cidr_map

  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.multi_sg.id
  description       = "Allow TCP port ${each.value.port} from ${each.value.cidr}"
}

output "security_group_id" {
  value = aws_security_group.multi_sg.id
}
