output "groups" {
  description = "List of group objects with keys 'arn', 'name' and 'unique_id'"
  value = { for x in concat([for group, properties in aws_iam_group.this : {
    name : group
    arn : properties.arn
    unique_id : properties.unique_id
    }
    ], [{
      name : aws_iam_group.admins.name
      arn : aws_iam_group.admins.arn
      unique_id : aws_iam_group.admins.unique_id
    },
    {
      name : aws_iam_group.users.name
      arn : aws_iam_group.users.arn
      unique_id : aws_iam_group.users.unique_id
    }
  ]) : x.name => x }

}

output "users" {
  description = "List of users objects with keys 'arn', 'name' and 'unique_id'"
  value = { for user, properties in aws_iam_user.this : user => {
    name : user
    arn : properties.arn
    unique_id : properties.unique_id
    }
  }
}
