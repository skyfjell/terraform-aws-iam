# terraform-aws-iam

## Outline

This module encapsulates AWS IAM Terrform resources. This module will automatically create an 'admins' group and 'users' group, thus they are protected group names. You can assign IAM users to either groups. Admins have global read only access but can assume true admin through federation.

## Examples

See the `examples/complete` for example usage.

## Testing

You can run the tests locally. You need golang and terraform cli installed. To run:

- `cd test`
- `go test`

## Usage

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.15  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.0.0 |

## Providers

| Name                                             | Version  |
| ------------------------------------------------ | -------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                  | resource    |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                    | resource    |
| [aws_iam_group.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                                   | resource    |
| [aws_iam_group_policy_attachment.admins-assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource    |
| [aws_iam_group_policy_attachment.admins-readonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)     | resource    |
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

| Name                                                | Description                                              | Type                                                                                                               | Default | Required |
| --------------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------- | :------: |
| <a name="input_groups"></a> [groups](#input_groups) | List of group objects. Protected group names: {'admins'} | <pre>list(object({<br> name = string<br> }))</pre>                                                                 | n/a     |   yes    |
| <a name="input_labels"></a> [labels](#input_labels) | value                                                    | `optional(map(any))`                                                                                               | n/a     |   yes    |
| <a name="input_users"></a> [users](#input_users)    | List of user objects                                     | <pre>list(object({<br> name = string<br> path = optional(string)<br> groups = optional(list(string))<br> }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                 | Description                                                   |
| -------------------------------------------------------------------- | ------------------------------------------------------------- |
| <a name="output_admin-users"></a> [admin-users](#output_admin-users) | List of users arns that are part of the admin group.          |
| <a name="output_groups"></a> [groups](#output_groups)                | List of group objects with keys 'arn', 'name' and 'unique_id' |
| <a name="output_users"></a> [users](#output_users)                   | List of users objects with keys 'arn', 'name' and 'unique_id' |
