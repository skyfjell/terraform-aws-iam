

resource "aws_iam_role" "this" {
  name_prefix        = "admin"
  assume_role_policy = data.aws_iam_policy_document.managed_admin.json
}


resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
