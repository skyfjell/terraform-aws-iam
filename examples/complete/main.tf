variable "users" {
  description = "List of user objects"
  type        = list(any)
}

variable "groups" {
  description = "List of group objects"
  type        = list(any)
}


module "labels" {
  source = "skyfjell/label/null"

  tenant      = "tf"
  environment = "test"
  project     = "mods"
  name        = "aws"
  app         = "iam"
}

module "iam" {
  source = "../../"
  users  = var.users
  groups = var.groups
  labels = module.labels
}

output "admin_users" {
  value = module.iam.admin_users
}

output "groups" {
  value = module.iam.groups
}
