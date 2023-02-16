resource "aws_iam_group" "this" {
  for_each = { for g in local.groups : g.name => format("%s%s", local.prefix, g.name) }
  name     = each.value
  path     = "/"
}

resource "aws_iam_group" "admins" {
  name = format("%s%s", local.prefix, "admins")
  path = "/"
}

resource "aws_iam_group" "users" {
  name = format("%s%s", local.prefix, "users")
  path = "/"
}

resource "aws_iam_group" "read-only" {
  name = format("%s%s", local.prefix, "read-only")
  path = "/"
}

resource "aws_iam_group_policy_attachment" "admins-assume-admin" {
  group      = aws_iam_group.admins.id
  policy_arn = aws_iam_policy.assume-admin.arn
}

resource "aws_iam_group_policy_attachment" "admins-read-only" {
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

resource "aws_iam_role_policy_attachment" "read-only" {
  role       = aws_iam_role.read-only.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "read-only-assume-read-only" {
  group      = aws_iam_group.read-only.id
  policy_arn = aws_iam_policy.assume-read-only.arn
}

data "aws_iam_group" "admins" {
  group_name = aws_iam_group.admins.name
  depends_on = [
    aws_iam_user_group_membership.this
  ]
}

data "aws_iam_group" "read-only" {
  group_name = aws_iam_group.read-only.name
  depends_on = [
    aws_iam_user_group_membership.this
  ]
}

resource "aws_iam_group" "billing" {
  name = format("%s%s", local.prefix, "billing")
  path = "/"
}

resource "aws_iam_group_policy_attachment" "billing" {
  group      = aws_iam_group.billing.id
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_group" "billing-ro" {
  name = format("%s%s", local.prefix, "billing-ro")
  path = "/"
}

resource "aws_iam_group_policy_attachment" "billing-ro" {
  group      = aws_iam_group.billing-ro.id
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}
