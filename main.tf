resource "aws_iam_account_password_policy" "this" {
  count = local.config_password_policy.enable ? 1 : 0
  #checkov:skip=CKV_AWS_9
  #checkov:skip=CKV_AWS_11
  #checkov:skip=CKV_AWS_12
  #checkov:skip=CKV_AWS_14
  #checkov:skip=CKV_AWS_15
  minimum_password_length        = local.config_password_policy.minimum_password_length
  require_lowercase_characters   = local.config_password_policy.require_lowercase_characters
  require_numbers                = local.config_password_policy.require_numbers
  require_uppercase_characters   = local.config_password_policy.require_uppercase_characters
  require_symbols                = local.config_password_policy.require_symbols
  allow_users_to_change_password = local.config_password_policy.allow_users_to_change_password
  password_reuse_prevention      = local.config_password_policy.password_reuse_prevention
}
