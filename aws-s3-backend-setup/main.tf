provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "replica"
  region = "us-east-2"
}

module "remote_state" {
  source              = "nozaq/remote-state-s3-backend/aws"
  dynamodb_table_name = "hello-world-fe-state-lock"
  state_bucket_prefix = "hello-world-fe-state"
  enable_replication = false

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
}

resource "aws_iam_user" "terraform" {
  name = "hello-world-fe-state-user-for-deployment"
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}