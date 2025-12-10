output "subnet_ids" {
  value = [
    aws_subnet.challenge_5["subnet1"].id,
    aws_subnet.challenge_5["subnet2"].id
  ]
}

output "vpc_id" {
  value = aws_vpc.main.id
}