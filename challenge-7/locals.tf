locals {
  data          = csvdecode(file("ec2.csv"))
  instance_type = toset([for item in local.data : item.instance_type])
}