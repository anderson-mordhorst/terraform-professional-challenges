terraform {
  required_version = "1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

locals {
  data      = csvdecode(file("ec2.csv"))
  instances = [for row in local.data : row if row.Region == "us-east-1"]
}

resource "aws_instance" "this" {
  count         = length(local.instances)
  ami           = local.instances[count.index].AMI_ID
  instance_type = local.instances[count.index].instance_type == "micro" ? "t2.micro" : "t3.nano"

  tags = {
    Name = local.instances[count.index].Team_Name
    type = local.instances[count.index].instance_type
  }
}

output "running_ec2" {
  value = [for value in aws_instance.this : {
    "firewall_id" = [for sg in value.vpc_security_group_ids : sg]
    "id"          = value.id
    "region"      = value.region
    "subnet"      = value.subnet_id
    "team"        = value.tags["Name"]
    "type"        = value.tags["type"]
  }]
}