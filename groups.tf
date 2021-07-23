resource "aws_iam_group" "this" {
  for_each      = { for x in local.groups : x.name => x }
  name          = format("%s%s", local.prefix, each.value.name)
  path          = "/"
  force_destroy = each.value.force_destroy == null ? true : each.value.force_destroy
}

resource "aws_iam_group" "admins" {
  name          = format("%s%s", local.prefix, "admins")
  path          = "/"
  force_destroy = true
}

resource "aws_iam_group" "users" {
  name          = format("%s%s", local.prefix, "users")
  path          = "/"
  force_destroy = true
}

resource "aws_iam_group_policy_attachment" "admins-assume-admin" {
  group      = aws_iam_group.admins.id
  policy_arn = aws_iam_policy.assume-admin.arn
}

resource "aws_iam_group_policy_attachment" "admins-readonly" {
  group      = aws_iam_group.admins.id
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "users" {
  group      = aws_iam_group.users.id
  policy_arn = aws_iam_policy.users-default.arn
}

data "aws_iam_group" "admins" {
  group_name = aws_iam_group.admins.name
  depends_on = [
    aws_iam_user_group_membership.this
  ]
}
