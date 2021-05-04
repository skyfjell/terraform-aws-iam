resource "aws_iam_user" "this" {
  for_each = local.users

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_user_group_membership" "this" {
  for_each = local.users

  user   = each.value.name
  groups = each.value.groups
}

# Create admins group

# Create users group

# Attach users policy(policies.tf)
