data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket     = "terraform-state-350644740974"
    key        = "terraform-challenges/challenge-5/vpc.tfstate"
    region     = "us-east-1"
    # aqui precisa ser setado o access_key e secret_key para funcionar no meu ambiente local
  }
}

module "ec2" {
  source     = "../../modules/ec2"
  subnet_ids = data.terraform_remote_state.network.outputs.subnet_ids
}

module "sg" {
  source = "../../modules/sg"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}