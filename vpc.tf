resource "aws_vpc" "default" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = merge({ Name = "${local.app_name}-vpc" }, local.tags)
} 