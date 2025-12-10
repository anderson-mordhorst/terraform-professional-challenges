import {
  id = "subnet-0f121c9faa254c662"
  to = module.vpc.aws_subnet.challenge_5["subnet1"]
}

import {
  id = "subnet-017994b98b354214c"
  to = module.vpc.aws_subnet.challenge_5["subnet2"]
}


import {
  id = "subnet-0654e2510b1ba1ddc"
  to = module.vpc.aws_subnet.random["subnet1"]
}

import {
  id = "subnet-02d30e878337ac18b"
  to = module.vpc.aws_subnet.random["subnet2"]
}

import {
  id = "vpc-0b81fce540c4c02b8"
  to = module.vpc.aws_vpc.main
}

import {
  id = "vpc-0f48b220c969d2890"
  to = module.vpc.aws_vpc.random
}