locals {
  iam-self = "arn:aws:iam::*:user/&{aws:username}"
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

    resources = [local.iam-self]
  }

  # AllowManageOwnUserMFA
  statement {
    actions = [
      "iam:DeactivateMFADevice",
      "iam:EnableMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice",
    ]

    resources = [local.iam-self]
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
    ]

    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"

      values = [false]
    }
  }
}



data "aws_iam_policy_document" "managed_admin" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }
}

data "aws_iam_policy_document" "assume_admin" {
  statement {
    effect = "Allow"

    actions   = ["sts:AssumeRole"]
    resources = [aws_iam_role.this.arn]
  }
}

