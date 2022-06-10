# Terraform AWS IAM Module

## This Module Has Moved To:

<https://registry.terraform.io/modules/etesiai/iam/aws/latest>

This module encapsulates AWS IAM Terrform resources. This module will automatically create an 'admins' group and 'users' group, thus they are protected group names. You can assign IAM users to either groups. Admins have global read only access but can assume true admin through federation.

- [Registry](https://registry.terraform.io/modules/OmniTeqSource/iam/aws/latest)

## Examples

- [Complete](https://github.com/OmniTeqSource/terraform-aws-iam/tree/main/examples/complete)

## Testing

You can run the tests locally. You need golang and terraform cli installed. To run:

- `cd test`
- `go test`

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.0.0 |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 3.38.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_account_password_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy)                | resource    |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                  | resource    |
| [aws_iam_group.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                 | resource    |
| [aws_iam_group.billing-ro](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                              | resource    |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                    | resource    |
| [aws_iam_group.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                   | resource    |
| [aws_iam_group_policy_attachment.admins-assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource    |
| [aws_iam_group_policy_attachment.admins-readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)     | resource    |
| [aws_iam_group_policy_attachment.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)             | resource    |
| [aws_iam_group_policy_attachment.billing-ro](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)          | resource    |
| [aws_iam_group_policy_attachment.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)               | resource    |
| [aws_iam_policy.assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                          | resource    |
| [aws_iam_policy.users-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                         | resource    |
| [aws_iam_role.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                     | resource    |
| [aws_iam_role_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)                 | resource    |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)                                                      | resource    |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership)                    | resource    |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_group)                                               | data source |
| [aws_iam_policy_document.assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                     | data source |
| [aws_iam_policy_document.managed-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                    | data source |
| [aws_iam_policy_document.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                            | data source |

## Inputs

| Name                                                                                                | Description                                                                                | Type                                                                                                                                                                                                                                                                                                                                                         | Default | Required |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | :------: |
| <a name="input_enable_password_policy"></a> [enable_password_policy](#input_enable_password_policy) | Whether to enable the password policy resource                                             | `bool`                                                                                                                                                                                                                                                                                                                                                       | `true`  |    no    |
| <a name="input_groups"></a> [groups](#input_groups)                                                 | List of group objects. Protected group names: ['admins', 'users', 'billing', 'billing-ro'] | <pre>list(object({<br> name = string<br> }))</pre>                                                                                                                                                                                                                                                                                                           | n/a     |   yes    |
| <a name="input_labels"></a> [labels](#input_labels)                                                 | Instance of labels module                                                                  | <pre>object(<br> {<br> id = optional(string)<br> }<br> )</pre>                                                                                                                                                                                                                                                                                               | `{}`    |    no    |
| <a name="input_password_policy"></a> [password_policy](#input_password_policy)                      | Password policy overrides                                                                  | <pre>object({<br> minimum_password_length = optional(number)<br> require_lowercase_characters = optional(bool)<br> require_numbers = optional(bool)<br> require_uppercase_characters = optional(bool)<br> require_symbols = optional(bool)<br> allow_users_to_change_password = optional(bool)<br> password_reuse_prevention = optional(number)<br> })</pre> | `{}`    |    no    |
| <a name="input_users"></a> [users](#input_users)                                                    | List of user objects                                                                       | <pre>list(object({<br> name = string<br> path = optional(string)<br> groups = optional(list(string))<br> force_destroy = optional(bool)<br> }))</pre>                                                                                                                                                                                                        | n/a     |   yes    |

## Outputs

| Name                                                                 | Description                                                                                        |
| -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- |
| <a name="output_admin_role"></a> [admin_role](#output_admin_role)    | The admin role object.                                                                             |
| <a name="output_admin_users"></a> [admin_users](#output_admin_users) | List of users arns that are part of the admin group.                                               |
| <a name="output_groups"></a> [groups](#output_groups)                | List of group objects with keys 'arn', 'name'(prefixed by labels.id if applicable) and 'unique_id' |
| <a name="output_users"></a> [users](#output_users)                   | List of users objects with keys 'arn', 'name' and 'unique_id'                                      |

<!-- END_TF_DOCS -->
