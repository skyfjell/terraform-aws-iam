output "groups" {
  description = "A nested map of group resources, with group name as the key, and each value map containing the groups's ARN and Unique ID."
  value = {
    for group, properties in aws_iam_group.this : group => {
      arn : properties.arn
      name : properties.name
      unique_id : properties.unique_id
    }
  }
}
