terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }

  backend "s3" {
    bucket     = "terraform-state-350644740974"
    key        = "terraform-challenges/challenge-5/vpc.tfstate"
    region     = "us-east-1"
    # aqui precisa ser setado o access_key e secret_key para funcionar no meu ambiente local
  }
}

provider "aws" {
  region     = "us-east-1"
  # aqui precisa ser setado o access_key e secret_key para funcionar no meu ambiente local
}