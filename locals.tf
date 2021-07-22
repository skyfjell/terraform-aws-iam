locals {
  users  = defaults(var.users, { path = "/" })
  groups = defaults(var.groups, {})
  labels = defaults(
    var.labels,
    { id = "" },
  )

  enable_password_policy = var.enable_password_policy
  password_policy = defaults(
    var.password_policy,
    {
      minimum_password_length        = 14
      require_lowercase_characters   = true
      require_numbers                = true
      require_uppercase_characters   = true
      require_symbols                = true
      allow_users_to_change_password = true
      password_reuse_prevention      = 24
    },
  )
}

locals {
  prefix = length(local.labels.id) == 0 ? "" : "${local.labels.id}-"
}
