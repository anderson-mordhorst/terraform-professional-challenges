output "subnet_ids" {
  value = local.subnets
}

output "filtered_data" {
  value = { for key, value in aws_vpc_security_group_ingress_rule.this : key => {
    cidr_block = value.cidr_ipv4
    from_port  = value.from_port
    to_port    = value.to_port
  } }
}