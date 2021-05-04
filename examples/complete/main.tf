module "iam" {
  source = "../../"
  users  = local.users
  groups = local.groups
}
