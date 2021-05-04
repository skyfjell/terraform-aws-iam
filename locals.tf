locals {
  users  = defaults(var.users, { path = "/" })
  groups = defaults(var.groups, {})
}
