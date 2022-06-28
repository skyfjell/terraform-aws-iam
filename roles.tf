resource "aws_iam_role" "admin" {
  name_prefix        = format("%s%s", local.prefix, "admin")
  assume_role_policy = data.aws_iam_policy_document.managed-admin.json
  tags               = local.labels.tags

  depends_on = [
    data.aws_iam_policy_document.managed-admin
  ]
}
