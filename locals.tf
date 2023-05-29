locals {
  users  = var.users
  groups = var.groups
  labels = var.labels

  config_password_policy = var.config_password_policy

  use_prefix = var.use_prefix

  admin_role_args = {
    max_session_duration = try(var.role_config.admin.max_session_duration, var.role_config.global.max_session_duration)
  }
  read_only_role_args = {
    max_session_duration = try(var.role_config.read_only.max_session_duration, var.role_config.global.max_session_duration)
  }
}

locals {
  prefix = length(local.labels.id) == 0 && local.use_prefix ? "" : "${local.labels.id}-"
}
