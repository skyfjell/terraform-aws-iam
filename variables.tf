variable "users" {
  description = "List of user objects"
  type = list(object({
    name = string
    path = optional(string)
  }))
}

variable "groups" {
  description = "List of group objects"
  type = list(object({
    name = string
  }))

  validation {
    condition = alltrue([
      for x in var.groups : !contains(["admins"], x.name)
    ])
    error_message = "The group `admins` is implicitly created"
  }
}

variable "labels" {
  description = "value"

  type = map(any)
}
