variable "aws_instance_profile" {}

data "aws_ami" "this" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250530"]
  }
}

resource "aws_instance" "this" {
  ami                  = data.aws_ami.this.id
  instance_type        = "t2.micro"
  iam_instance_profile = var.aws_instance_profile
}