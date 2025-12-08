terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  shared_config_files      = [".aws/conf"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "asg"
  alias                    = "asg"
}

provider "aws" {
  shared_config_files      = [".aws/conf"]
  shared_credentials_files = [".aws/credentials"]
  profile                  = "iam"
  alias                    = "iam"
}

provider "aws" {
  alias      = "local"
  # Aqui devemos serar acess_key e secret_key para o usuário ro-user
  region     = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::350644740974:role/ReadOnlyRole"
    session_name = "local-session"
  }
}

data "aws_caller_identity" "local" {
  provider = aws.local
}

resource "local_file" "this" {
  content  = data.aws_caller_identity.local.account_id
  filename = "account-number.txt"
}

module "asg" {
  source = "./modules/asg"
  providers = {
    aws = aws.asg
  }
}

module "iam" {
  source = "./modules/iam"
  providers = {
    aws = aws.iam
  }
}