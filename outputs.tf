output "groups" {
  description = "List of group objects with keys 'arn', 'name'(prefixed by labels.id if applicable) and 'unique_id'"
  value = merge(
    {
      for name, group in aws_iam_group.this : name => {
        name : group.name
        arn : group.arn
        unique_id : group.unique_id
      }
    },
    {
      "admins" = {
        name : aws_iam_group.admins.name
        arn : aws_iam_group.admins.arn
        unique_id : aws_iam_group.admins.unique_id
      },
      "users" = {
        name : aws_iam_group.users.name
        arn : aws_iam_group.users.arn
        unique_id : aws_iam_group.users.unique_id
      },
      "read-only" = {
        name : aws_iam_group.read-only.name
        arn : aws_iam_group.read-only.arn
        unique_id : aws_iam_group.read-only.unique_id
      },
    }
  )
}

output "users" {
  description = "List of users objects with keys 'arn', 'name' and 'unique_id'"
  value = {
    for name, user in aws_iam_user.this : name => {
      name : name
      arn : user.arn
      unique_id : user.unique_id
    }
  }
}

output "admin_users" {
  description = "List of users arns that are part of the admin group."
  value       = [for user in data.aws_iam_group.admins.users : user.arn]
}

output "admin_role" {
  description = "The admin role object."
  value       = aws_iam_role.admin
}
