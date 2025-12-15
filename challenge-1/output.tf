output "s3_buckets" {
  value = [for b in aws_s3_bucket.example : b.bucket]
}

output "user_names" {
  value = aws_iam_user.lb[*].name
}

output "sg_id" {
  value = aws_security_group.example.id
}

output "sg_rule_id" {
  value = aws_vpc_security_group_ingress_rule.example.id
}