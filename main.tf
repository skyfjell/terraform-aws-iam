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

resource "aws_iam_group" "this" {
  for_each = local.groups

  name = each.key
  path = each.value["path"]
}

resource "aws_iam_group" "admins" {
  name = "admins"
  path = "/"
}


# Create users group

# Attach users policy(policies.tf)
