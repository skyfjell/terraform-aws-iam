output "groups" {
  description = "A nested map of group resources, with group name as the key, and each value map containing the groups's ARN and Unique ID."
  value = concat([for group, properties in aws_iam_group.this : {
    group : group
    arn : properties.arn
    unique_id : properties.unique_id
    }
    ], [{
      group : aws_iam_group.admins.name
      arn : aws_iam_group.admins.arn
      unique_id : aws_iam_group.admins.unique_id
    },
    {
      group : aws_iam_group.users.name
      arn : aws_iam_group.users.arn
      unique_id : aws_iam_group.users.unique_id
    }
  ])
}

