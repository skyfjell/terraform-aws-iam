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
    condition     = alltrue([for group in var.groups : !contains(["users", "admins", "billing", "billing-ro", "read-only"], group.name)])
    error_message = "The `groups` variable elements cannot contain the values `[\"users\", \"admins\", \"billing\", \"billing-ro\", \"read-only\"]`."
  }
}

variable "labels" {
  description = "Instance of Labels Module"
  type = object(
    {
      id   = optional(string, "")
      tags = optional(any, {})
    }
  )
  default = {}
}

variable "config_password_policy" {
  description = "Password Policy"

  type = object({
    enable                         = optional(bool, true)
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
  description = "Prefix Resources"
  type        = bool
  default     = true
}

variable "config_terraform_user" {
  description = "Create Terraform User/Role"
  type = object({
    enable_user = optional(bool, false)
    enable_role = optional(bool, false)
  })
  default = {}
}
