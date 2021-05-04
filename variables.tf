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
}

variable "labels" {
  description = "value"

  type = map(any)
}
