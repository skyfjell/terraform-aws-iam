resource "aws_iam_user" "this" {
  for_each = { for x in local.users : x.name => x }

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for x in local.users : x.name => x }

  user   = each.value.name
  groups = each.value.groups

  depends_on = [aws_iam_user.this, aws_iam_group.this, aws_iam_group.admins, aws_iam_group.users]
}
