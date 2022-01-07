provider "aws" {
  region = var.region
}

#Creating security group rules
resource "aws_security_group" "jayaworld-security-group" {
  count       = var.create_security_group ? 1 : 0
  name        = var.security_group_name
  description = var.sg_description
  vpc_id      = var.vpc_id
  tags        = merge(var.sg_tags)

  dynamic "ingress" {
    for_each = var.ingress == null ? [] : var.ingress

    content {
      from_port        = lookup(ingress.value, "from_port", null)
      to_port          = lookup(ingress.value, "to_port", null)
      protocol         = lookup(ingress.value, "protocol", null)
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      description      = lookup(ingress.value, "description", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", null)
      security_groups  = lookup(ingress.value, "security_groups", null)
      self             = lookup(ingress.value, "self", null)
    }
  }

  dynamic "egress" {
    for_each = var.egress == null ? [] : var.egress

    content {
      from_port        = lookup(egress.value, "from_port", null)
      to_port          = lookup(egress.value, "to_port", null)
      protocol         = lookup(egress.value, "protocol", null)
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      description      = lookup(egress.value, "description", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(egress.value, "prefix_list_ids", null)
      security_groups  = lookup(egress.value, "security_groups", null)
      self             = lookup(egress.value, "self", null)

    }
  }
}
