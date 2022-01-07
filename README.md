> **Thanks for using Jaya world modules**

> **Example to create new Security Group**

module "jayaworld-security-group" {

  source  = "JayavardhanTummidi/jayaworld-security-group/aws"

}

  create_security_group = true

  security_group_name   = "jayaworld-sg"

  ingress = [

    {

      protocol    = "TCP"

      from_port   = 8080

      to_port     = 8080

      cidr_blocks = ["0.0.0.0/0"]

    },

    {

      protocol    = "TCP"

      from_port   = 8443

      to_port     = 8443

      cidr_blocks = ["0.0.0.0/0"]

    }

]

egress = [

    {

      protocol    = "TCP"

      from_port   = 8080

      to_port     = 8080

      cidr_blocks = ["0.0.0.0/0"]

    },

    {

      protocol    = "TCP"

      from_port   = 8443

      to_port     = 8443

      cidr_blocks = ["0.0.0.0/0"]

    }

]




