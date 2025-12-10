# locals {
#   data = csvdecode(file("sg.csv"))
# }

# resource "aws_security_group" "this" {
#   for_each = toset(["app-1-sg", "app-2-sg"])

#   name   = each.value
#   vpc_id = aws_vpc.main.id
# }

# resource "aws_vpc_security_group_ingress_rule" "this" {
#   for_each = { for indice, valor in local.data : indice => valor if valor.description == "app-1" && valor.direction == "in" }

#   security_group_id = aws_security_group.this["app-1-sg"].id
#   cidr_ipv4         = each.value.cidr_block
#   from_port         = each.value.port
#   ip_protocol       = each.value.protocol
#   to_port           = each.value.port
# }

# resource "aws_vpc_security_group_egress_rule" "this" {
#   for_each = { for indice, valor in local.data : indice => valor if valor.description == "app-2" && valor.direction == "out" }

#   security_group_id = aws_security_group.this["app-2-sg"].id
#   cidr_ipv4         = each.value.cidr_block
#   from_port         = each.value.port
#   ip_protocol       = each.value.protocol
#   to_port           = each.value.port
# }