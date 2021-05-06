resource "aws_iam_role" "admin" {
  name_prefix        = "admin"
  assume_role_policy = data.aws_iam_policy_document.managed-admin.json
}
