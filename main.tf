data "aws_caller_identity" "this" {}

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

# Create admins group

resource "aws_iam_group" "this" {
  for_each = { for x in local.groups : x.name => x }
  name     = each.value.name
  path     = "/"
}

resource "aws_iam_group" "admins" {
  name = "admins"
  path = "/"
}


# Create users group

resource "aws_iam_group" "users" {
  name = "users"
  path = "/"
}

# Attach users policy(policies.tf)

resource "aws_iam_policy" "users-default" {
  name_prefix = "default-users-policy"
  path        = "/users/"
  description = "Default policy for a user to self manage"
  policy      = data.aws_iam_policy_document.users.json
}


resource "aws_iam_policy" "admins-assume-admin" {
  name_prefix = "admins-assume-admin"
  description = "Allows to assume role in another AWS account"
  policy      = data.aws_iam_policy_document.assume-admin.json

}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.admins.id
  policy_arn = aws_iam_policy.admins-assume-admin.arn
}
