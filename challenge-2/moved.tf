moved {
  from = random_pet.this
  to   = module.random.random_pet.this
}

moved {
  from = aws_iam_instance_profile.test_profile
  to   = module.iam.aws_iam_instance_profile.test_profile
}

moved {
  from = aws_iam_instance_profile.test_profile
  to   = module.iam.aws_iam_instance_profile.test_profile
}

moved {
  from = aws_iam_user.lb
  to   = module.iam.aws_iam_user.lb
}

moved {
  from = aws_iam_user_policy.lb_ro
  to   = module.iam.aws_iam_user_policy.lb_ro
}

moved {
  from = aws_iam_role.test_role
  to   = module.iam.aws_iam_role.test_role
}

moved {
  from = aws_instance.this
  to   = module.ec2.aws_instance.this
}

moved {
  from = aws_security_group.example
  to   = module.sg.aws_security_group.example
}

moved {
  from = aws_vpc_security_group_ingress_rule.example
  to   = module.sg.aws_vpc_security_group_ingress_rule.example
}

moved {
  from = aws_s3_bucket.example
  to   = module.s3.aws_s3_bucket.example
}

moved {
  from = aws_s3_object.object
  to   = module.s3.aws_s3_object.object
}

moved {
  from = data.aws_ami.this
  to   = module.ec2.data.aws_ami.this
}

moved {
  from = data.aws_iam_policy_document.assume_role
  to   = module.iam.data.aws_iam_policy_document.assume_role
}