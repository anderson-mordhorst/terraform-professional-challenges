terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias = "readonly"
  # Acces key and secret key will be picked up from de file created in base-folder/main.tf (default-creds.txt)
  assume_role {
    role_arn     = "arn:aws:iam::350644740974:role/ReadOnlyRole"
    session_name = "terraform-session"
  }
}

provider "aws" {
  alias                    = "ec2"
  profile                  = "ec2-access"
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
}

provider "aws" {
  alias                    = "iam"
  profile                  = "iam-access"
  shared_config_files      = ["./.aws/config"]
  shared_credentials_files = ["./.aws/credentials"]
}

resource "aws_security_group" "allow_tls" {
  provider = aws.ec2
  name     = "demo-firewall"
}

data "aws_caller_identity" "current" {
  provider = aws.readonly
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}


resource "aws_iam_role" "cw_full_access" {
  provider = aws.iam
  name     = "CloudWatchFullAccess"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  provider   = aws.iam
  role       = aws_iam_role.cw_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}
