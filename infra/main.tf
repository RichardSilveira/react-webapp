terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

  backend "s3" {
    bucket         = "hello-world-fe-state20220419185231625600000001"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    kms_key_id     = "f230ae94-6671-43bf-90ec-a5bb0e563ad2"
    dynamodb_table = "hello-world-fe-state-lock"
  }

}

locals {
  common_aws_tags = {
    Project = var.project_name
  }
}
