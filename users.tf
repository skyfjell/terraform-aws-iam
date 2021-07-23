resource "aws_iam_user" "this" {
  for_each = { for x in local.users : x.name => x }

  name          = each.value.name
  path          = each.value.path
  force_destroy = each.value.force_destroy == null ? true : each.value.force_destroy
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for x in local.users : x.name => x }

  user   = each.value.name
  groups = [for x in each.value.groups : format("%s%s", local.prefix, x)]

  depends_on = [
    aws_iam_user.this,
    aws_iam_group.this,
    aws_iam_group.admins,
    aws_iam_group.users
  ]
}
