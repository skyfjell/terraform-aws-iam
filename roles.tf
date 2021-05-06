

resource "aws_iam_role" "admin" {
  name_prefix        = "admin"
  assume_role_policy = data.aws_iam_policy_document.managed-admin.json
}


resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
