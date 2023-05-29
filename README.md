# Terraform AWS IAM Module

NIST 800-63 compliant IAM user, group, and role configuration.

## Examples

- [Complete](https://github.com/skyfjell/terraform-aws-iam/tree/main/examples/complete)

## Testing

You can run the tests locally. You need golang and terraform cli installed. To run:

- `cd test`
- `go test`

<!-- prettier-ignore-start -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_account_password_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.billing-ro](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.admins-assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.admins-read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.billing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.billing-ro](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.read-only-assume-read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assume-read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.users-default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_group.admins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_group) | data source |
| [aws_iam_group.read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_group) | data source |
| [aws_iam_policy_document.admin-assume-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume-admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume-read-only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read-only-assume-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_password_policy"></a> [config\_password\_policy](#input\_config\_password\_policy) | Password Policy | <pre>object({<br>    enable                         = optional(bool, true)<br>    minimum_password_length        = optional(number, 14)<br>    require_lowercase_characters   = optional(bool, true)<br>    require_numbers                = optional(bool, true)<br>    require_uppercase_characters   = optional(bool, true)<br>    require_symbols                = optional(bool, true)<br>    allow_users_to_change_password = optional(bool, true)<br>    password_reuse_prevention      = optional(number, 24)<br>  })</pre> | `{}` | no |
| <a name="input_config_terraform_user"></a> [config\_terraform\_user](#input\_config\_terraform\_user) | Create Terraform User/Role | <pre>object({<br>    enable_user = optional(bool, false)<br>    enable_role = optional(bool, false)<br>  })</pre> | `{}` | no |
| <a name="input_groups"></a> [groups](#input\_groups) | List of group objects. Protected group names: ['admins', 'users', 'billing', 'billing-ro'] | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Instance of Labels Module | <pre>object(<br>    {<br>      id   = optional(string, "")<br>      tags = optional(any, {})<br>    }<br>  )</pre> | `{}` | no |
| <a name="input_role_config"></a> [role\_config](#input\_role\_config) | Builtin role configurations exposed. `admin` and `read-only` share same type as `global` but will override `global`. | <pre>object({<br>    global = optional(object({<br>      max_session_duration = optional(number, 1)<br>    }))<br>    admin     = optional(map(any))<br>    read-only = optional(map(any))<br>  })</pre> | `{}` | no |
| <a name="input_use_prefix"></a> [use\_prefix](#input\_use\_prefix) | Prefix Resources | `bool` | `true` | no |
| <a name="input_users"></a> [users](#input\_users) | List of user objects | <pre>list(object({<br>    name          = string<br>    path          = optional(string, "/")<br>    groups        = optional(list(string))<br>    force_destroy = optional(bool)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_role"></a> [admin\_role](#output\_admin\_role) | The admin role object. |
| <a name="output_admin_users"></a> [admin\_users](#output\_admin\_users) | List of users arns that are part of the admin group. |
| <a name="output_groups"></a> [groups](#output\_groups) | List of group objects with keys 'arn', 'name'(prefixed by labels.id if applicable) and 'unique\_id' |
| <a name="output_users"></a> [users](#output\_users) | List of users objects with keys 'arn', 'name' and 'unique\_id' |
<!-- END_TF_DOCS -->
<!-- prettier-ignore-end -->
