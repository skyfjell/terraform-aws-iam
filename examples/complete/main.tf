provider "aws" {
  alias   = "us-east-2"
  region  = "us-east-2"
  profile = "l2-internal-test"
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
