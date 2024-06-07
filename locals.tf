locals {
  created_on = time_static.now.rfc3339

  common_tags = merge(
    var.tags,
    {
      "CreatedOn" = local.created_on
    }
  )

  public_subnet_cidrs = var.create_subnets ? [
    cidrsubnet(var.cidr_block, 8, 1),
    cidrsubnet(var.cidr_block, 8, 2)
  ] : var.public_subnet_cidrs

  private_subnet_cidrs = var.create_subnets ? [
    cidrsubnet(var.cidr_block, 8, 3),
    cidrsubnet(var.cidr_block, 8, 4)
  ] : var.private_subnet_cidrs
}
