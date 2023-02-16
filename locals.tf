locals {
  users  = var.users
  groups = var.groups
  labels = var.labels

  config_password_policy = var.config_password_policy

  use_prefix = var.use_prefix
}

locals {
  prefix = length(local.labels.id) == 0 && local.use_prefix ? "" : "${local.labels.id}-"
}
