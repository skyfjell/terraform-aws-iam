locals {
  users      = defaults(var.users, { path = "/" })
  groups     = defaults(var.groups, {})
  account_id = var.account_id
}
