data "aws_vpc" "central" {
  filter {
    name   = "tag:Name"
    values = ["central-vpc"]
  }
}

data "aws_subnets" "this" {
  filter {
    name   = "tag:Name"
    values = ["*-subnet"]
  }
}

data "aws_subnet" "this" {
  for_each = toset(data.aws_subnets.this.ids)
  id       = each.key
}