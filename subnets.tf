resource "aws_subnet" "public_subnets" {
  count = length(local.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(local.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name = "${var.vpc_name}-public-${count.index + 1}"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(local.private_subnet_cidrs)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(local.private_subnet_cidrs, count.index)

  tags = merge(
    {
      Name = "${var.vpc_name}-private-${count.index + 1}"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}
