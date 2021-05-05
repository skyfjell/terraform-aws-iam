provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}


module "iam" {
  source = "../../"
  users  = local.users
  groups = local.groups

  labels = {
    "testing" : "true"
  }
}
