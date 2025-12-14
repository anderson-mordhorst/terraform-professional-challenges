locals {
  subnets = { for s in data.aws_subnet.this : lookup(s.tags, "Name", "") => {
    id         = s.id
    cidr_block = s.cidr_block
  } }

  data = csvdecode(file("sg.csv"))

  ingress_data = { for item, value in local.data : item => {
    name      = "${value.cidr_block == "monitoring" || value.cidr_block == "anti-virus" ? "central" : value.cidr_block}-subnet"
    from_port = split("-", value.port)[0]
    to_port   = length(split("-", value.port)) > 1 ? split("-", value.port)[1] : split("-", value.port)[0]
    protocol  = value.protocol
    }
  if value.direction == "in" }
}