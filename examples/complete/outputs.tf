output "groups" {
  description = "A nested map of group resources, with group name as the key, and each value map containing the groups's ARN and Unique ID."
  value       = module.iam.groups
}

output "admin-users" {
  value = module.iam.admin-users
}
