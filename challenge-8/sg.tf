resource "aws_security_group" "kblabs" {
  vpc_id = data.aws_vpc.central.id

  tags = {
    Name = "kplabs-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = local.ingress_data

  security_group_id = aws_security_group.kblabs.id
  cidr_ipv4         = local.subnets[each.value.name].cidr_block
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.protocol
}