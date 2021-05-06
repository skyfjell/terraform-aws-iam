resource "aws_iam_group" "this" {
  for_each = { for x in local.groups : x.name => x }
  name     = each.value.name
  path     = "/"
}

resource "aws_iam_group" "admins" {
  name = "admins"
  path = "/"
}

resource "aws_iam_group" "users" {
  name = "users"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "admins-assume-admin" {
  group      = aws_iam_group.admins.id
  policy_arn = aws_iam_policy.assume-admin.arn
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_group" "admins" {
  group_name = aws_iam_group.admins.name
}
