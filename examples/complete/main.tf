provider "aws" {
  alias = "us-east-2"
}

module "iam" {
  source = "../../"
  users  = local.users
  groups = local.groups

  labels = {
    "testing" : "true"
  }

  providers = {
    aws = aws.us-east-2
  }
}
