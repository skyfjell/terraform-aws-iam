locals {
  users  = var.users
  groups = var.groups
  labels = var.labels

  config_password_policy = var.config_password_policy

  use_prefix = var.use_prefix

  admin_role_args = {
    max_session_duration = try(var.config_role.admin.max_session_duration, var.config_role.global.max_session_duration, 3600)
  }
  read_only_role_args = {
    max_session_duration = try(var.config_role.read_only.max_session_duration, var.config_role.global.max_session_duration, 3600)
  }
}

locals {
  prefix = length(local.labels.id) == 0 && local.use_prefix ? "" : "${local.labels.id}-"
}
