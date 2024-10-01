variable "vpc_id" {
  description = "vpc_id"
  type        = string
}

variable "security_group_info" {
  type = object({
    name        = string
    description = string
    inbound_rules = list(object({
      protocol    = string
      port        = number
      source      = string
      description = string
    }))
  })
}