terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environement
    }
  }
}

module "random" {
  source = "./modules/random"
}

module "iam" {
  source      = "./modules/iam"
  org-name    = var.org-name
  user_prefix = module.random.name
}

module "ec2" {
  source               = "./modules/ec2"
  aws_instance_profile = module.iam.profile
}

module "sg" {
  source  = "./modules/sg"
  sg_name = var.sg_name
}

module "s3" {
  source         = "./modules/s3"
  bucket_prefix  = module.random.name
  s3_buckets     = var.s3_buckets
  s3_base_object = var.s3_base_object
}