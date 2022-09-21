variable "users" {
  description = "List of user objects"
  type = list(object({
    name          = string
    path          = optional(string, "/")
    groups        = optional(list(string))
    force_destroy = optional(bool)
  }))
  default = []
}

variable "groups" {
  description = "List of group objects. Protected group names: ['admins', 'users', 'billing', 'billing-ro']"

  type = list(object({
    name = string
  }))

  default = []

  validation {
    condition     = alltrue([for group in var.groups : !contains(["users", "admins", "billing", "billing-ro"], group.name)])
    error_message = "The `groups` variable elements cannot contain the values `[\"users\", \"admins\", \"billing\", \"billing-ro\"]`."
  }
}

variable "labels" {
  description = "Instance of labels module"
  type = object(
    {
      id   = optional(string, "")
      tags = optional(any, {})
    }
  )
  default = {}
}

variable "enable_password_policy" {
  description = "Whether to enable the password policy resource"
  type        = bool
  default     = true
}

variable "password_policy" {
  description = "Password policy overrides"

  type = object({
    minimum_password_length        = optional(number, 14)
    require_lowercase_characters   = optional(bool, true)
    require_numbers                = optional(bool, true)
    require_uppercase_characters   = optional(bool, true)
    require_symbols                = optional(bool, true)
    allow_users_to_change_password = optional(bool, true)
    password_reuse_prevention      = optional(number, 24)
  })

  default = {}
}


variable "use_prefix" {
  description = "Use prefix on all names generate by labels module"
  type        = bool
  default     = true
}
