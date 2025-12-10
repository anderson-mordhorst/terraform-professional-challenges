import {
  id = "i-0536c5ed70e22090c"
  to = module.ec2.aws_instance.this["subnet-017994b98b354214c"]
}

import {
  id = "i-0bb6866cd07ca2d63"
  to = module.ec2.aws_instance.this["subnet-0f121c9faa254c662"]
}

import {
  id = "sg-0f8132ac6c7f281d0"
  to = module.sg.aws_security_group.this["app-1-sg"]
}

import {
  id = "sg-04da858ab10c8b59d"
  to = module.sg.aws_security_group.this["app-2-sg"]
}

import {
  id = "sgr-060ebac329616cea7"
  to = module.sg.aws_vpc_security_group_egress_rule.this["1"]
}

import {
  id = "sgr-01a2a1d3a654f107b"
  to = module.sg.aws_vpc_security_group_egress_rule.this["3"]
}

import {
  id = "sgr-0640b92ed33953d5e"
  to = module.sg.aws_vpc_security_group_ingress_rule.this["0"]
}

import {
  id = "sgr-0db362d26181c5b1b"
  to = module.sg.aws_vpc_security_group_ingress_rule.this["2"]
}