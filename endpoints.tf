resource "aws_vpc_endpoint" "endpoints" {
  count = length(var.endpoints)

  vpc_id       = aws_vpc.main.id
  service_name = element(var.endpoints, count.index)

  private_dns_enabled = var.endpoints_private_dns_enabled[count.index]
  security_group_ids  = var.endpoints_security_group_ids[count.index]
  subnet_ids          = var.endpoints_subnet_ids[count.index]
  vpc_endpoint_type   = var.endpoints_type[count.index]

  tags = merge(
    {
      Name = "${var.vpc_name}-endpoint-${count.index + 1}"
    },
    local.common_tags
  )

  lifecycle {
    ignore_changes = [tags["CreatedOn"]]
  }
}
