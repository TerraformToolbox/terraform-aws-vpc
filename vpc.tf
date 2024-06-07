resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy

  tags = merge(
    {
      Name = var.vpc_name
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.create_internet_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      Name = "${var.vpc_name}-igw"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}
