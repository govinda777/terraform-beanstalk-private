data "aws_availability_zones" "available" {}

resource "aws_subnet" "private" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.default.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.default.id
  tags              = merge({ Name = "${local.app_name}-subnet" }, local.tags)
}