locals {
  iam-self = "arn:aws:iam::*:user/&{aws:username}"
  mfa-self = "arn:aws:iam::*:mfa/&{aws:username}"
}

data "aws_iam_policy_document" "users" {
  # AllowViewAccountInfo
  statement {
    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
      "iam:ListVirtualMFADevices",
    ]

    resources = ["*"]
  }

  # AllowManageOwnPasswords
  statement {
    actions = [
      "iam:ChangePassword",
      "iam:GetUser",
    ]

    resources = [local.iam-self]
  }

  # AllowManageOwnAccessKeys
  statement {
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
    ]

    resources = [local.iam-self]
  }

  # AllowManageOwnSigningCertificates
  statement {
    actions = [
      "iam:DeleteSigningCertificate",
      "iam:ListSigningCertificates",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate",
    ]

    resources = [local.iam-self]
  }

  # AllowManageOwnSSHPublicKeys
  statement {
    actions = [
      "iam:DeleteSSHPublicKey",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey",
    ]

    resources = [local.iam-self]
  }

  # AllowManageOwnGitCredentials
  statement {
    actions = [
      "iam:CreateServiceSpecificCredential",
      "iam:DeleteServiceSpecificCredential",
      "iam:ListServiceSpecificCredentials",
      "iam:ResetServiceSpecificCredential",
      "iam:UpdateServiceSpecificCredential",
    ]

    resources = [local.iam-self]
  }

  # AllowManageOwnVirtualMFADevice
  statement {
    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
    ]

    resources = [local.iam-self, local.mfa-self]
  }

  # AllowManageOwnUserMFA
  statement {
    actions = [
      "iam:DeactivateMFADevice",
      "iam:EnableMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice",
    ]

    resources = [local.iam-self, local.mfa-self]
  }

  # DenyAllExceptListedIfNoMFA
  statement {
    effect = "Deny"
    not_actions = [
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken",
      "iam:GetAccountPasswordPolicy",
      "iam:ChangePassword",
    ]

    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = [false]
    }
  }
}

resource "aws_iam_policy" "users-default" {
  name_prefix = "default-users-policy"
  path        = "/users/"
  description = "Default policy for a user to self manage"
  policy      = data.aws_iam_policy_document.users.json
}

resource "aws_iam_policy" "assume-admin" {
  name_prefix = "assume-admin"
  description = "Allows to assume role in another AWS account"
  policy      = data.aws_iam_policy_document.assume-admin.json

}

data "aws_iam_policy_document" "managed-admin" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [for user in data.aws_iam_group.admins.users : user.arn]
    }

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = [true]
    }
  }
}

data "aws_iam_policy_document" "assume-admin" {
  statement {
    effect = "Allow"

    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.admin.arn]
  }
}
