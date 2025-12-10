resource "aws_instance" "this" {
  for_each = var.subnet_ids

  subnet_id     = each.value
  ami           = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
}