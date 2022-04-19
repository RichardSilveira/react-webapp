terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10"
    }
  }

  backend "s3" {
    bucket     = "tf-remote-state20220418151130964000000002"
    key        = "dev/terraform.tfstate"
    region     = "us-east-1"
    encrypt    = true
    kms_key_id = "f230ae94-6671-43bf-90ec-a5bb0e563ad2"
  }

}

locals {
  common_aws_tags = {
    Project = var.project_name
  }
}
