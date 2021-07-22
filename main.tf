resource "aws_iam_account_password_policy" "this" {
  count = local.enable_password_policy ? 1 : 0
  #checkov:skip=CKV_AWS_9
  #checkov:skip=CKV_AWS_11
  #checkov:skip=CKV_AWS_12
  #checkov:skip=CKV_AWS_14
  #checkov:skip=CKV_AWS_15
  minimum_password_length        = local.password_policy.minimum_password_length
  require_lowercase_characters   = local.password_policy.require_lowercase_characters
  require_numbers                = local.password_policy.require_numbers
  require_uppercase_characters   = local.password_policy.require_uppercase_characters
  require_symbols                = local.password_policy.require_symbols
  allow_users_to_change_password = local.password_policy.allow_users_to_change_password
  password_reuse_prevention      = local.password_policy.password_reuse_prevention
}
