provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

data "aws_caller_identity" "iam" {}

module "iam" {
  source = "../../"
  users  = local.users
  groups = local.groups

  account_id = data.aws_caller_identity.iam.account_id

  labels = {
    "testing" : "true"
  }

  providers = {
    aws = aws.us-east-2
  }
}
