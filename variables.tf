variable "users" {
  description = "List of user objects"
  type = list(object({
    name   = string
    path   = optional(string)
    groups = optional(list(string))
  }))
}

variable "groups" {
  description = "List of group objects. Protected group names: {'admins'}"
  type = list(object({
    name = string
  }))

  validation {
    condition     = alltrue([for group in var.groups : !contains(["users", "admins"], group.name)])
    error_message = "The `groups` variable elements cannot contain the values `[\"users\", \"admins\"]`."
  }
}

variable "labels" {
  description = "value"

  type = optional(map(any))
}

