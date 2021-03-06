variable "users" {
  description = "List of user objects"
  type = list(object({
    name          = string
    path          = optional(string)
    groups        = optional(list(string))
    force_destroy = optional(bool)
  }))
}

variable "groups" {
  description = "List of group objects. Protected group names: ['admins', 'users', 'billing', 'billing-ro']"
  type = list(object({
    name = string
  }))

  validation {
    condition     = alltrue([for group in var.groups : !contains(["users", "admins", "billing", "billing-ro"], group.name)])
    error_message = "The `groups` variable elements cannot contain the values `[\"users\", \"admins\", \"billing\", \"billing-ro\"]`."
  }
}

variable "labels" {
  description = "Instance of labels module"
  type = object(
    {
      id   = string
      tags = any
    }
  )
  default = {
    id   = ""
    tags = {}
  }
}

variable "enable_password_policy" {
  description = "Whether to enable the password policy resource"
  default     = true
  type        = bool
}

variable "password_policy" {
  description = "Password policy overrides"
  default     = {}
  type = object({
    minimum_password_length        = optional(number)
    require_lowercase_characters   = optional(bool)
    require_numbers                = optional(bool)
    require_uppercase_characters   = optional(bool)
    require_symbols                = optional(bool)
    allow_users_to_change_password = optional(bool)
    password_reuse_prevention      = optional(number)
  })
}

variable "use_prefix" {
  description = "Use prefix on all names generate by labels module"
  default     = true
  type        = bool
}
