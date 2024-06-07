resource "aws_route_table" "public" {
  count  = var.create_internet_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_internet_gateway.igw[*].id, 0)
  }

  tags = merge(
    {
      Name = "${var.vpc_name}-public"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public_subnets)

  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.public[*].id, 0)
}

resource "aws_route_table" "private" {
  count  = var.create_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat[*].id, 0)
  }

  tags = merge(
    {
      Name = "${var.vpc_name}-private"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private_subnets)

  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, 0)
}
