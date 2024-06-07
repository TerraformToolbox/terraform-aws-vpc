resource "aws_nat_gateway" "nat" {
  count             = var.create_nat_gateway ? length(aws_subnet.public_subnets) : 0
  allocation_id     = element(aws_eip.nat_eip[*].id, count.index)
  subnet_id         = element(aws_subnet.public_subnets[*].id, count.index)
  connectivity_type = "public"

  tags = merge(
    {
      Name = "${var.vpc_name}-nat-${count.index + 1}"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}

resource "aws_eip" "nat_eip" {
  count = var.create_nat_gateway ? length(aws_subnet.public_subnets) : 0
  vpc   = true

  tags = merge(
    {
      Name = "${var.vpc_name}-nat-eip-${count.index + 1}"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}
