resource "aws_iam_role" "admin" {
  name_prefix          = format("%s%s", local.prefix, "admin")
  assume_role_policy   = data.aws_iam_policy_document.admin-assume-role.json
  tags                 = local.labels.tags
  max_session_duration = local.admin_role_args.max_session_duration

  depends_on = [
    data.aws_iam_policy_document.admin-assume-role
  ]
}

resource "aws_iam_role" "read-only" {
  name_prefix          = format("%s%s", local.prefix, "read-only")
  assume_role_policy   = data.aws_iam_policy_document.read-only-assume-role.json
  tags                 = local.labels.tags
  max_session_duration = local.read_only_role_args.max_session_duration


  depends_on = [
    data.aws_iam_policy_document.read-only-assume-role
  ]
}
