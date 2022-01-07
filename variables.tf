variable "region" {
  description = "specify region name"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  default     = ""
}

variable "create_security_group" {
  description = "Do you want to create security group ? "
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "Name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}

variable "sg_description" {
  description = "Security group description. Defaults to Managed by Terraform"
  type        = string
  default     = "Managed by Terraform"
}

variable "sg_tags" {
  description = "security group tags"
  type        = map(string)
  default = {
    Name = "jayaworld-sg-tags"
  }
}

variable "ingress" {
  description = "SG ingress rules"
  type        = list(any)
  default     = []
}

variable "egress" {
  description = "SG egress rules"
  type        = list(any)
  default     = []
}