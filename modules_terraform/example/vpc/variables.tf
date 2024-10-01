variable "aws_vpc" {
  type = object({
    cidr_block = string
    enable_dns_hostnames  = bool
    tags = map(string) 
  })
}

variable "aws_public" {
  type = list(object({
    cidr_block = string
    availability_zones = string
    tags = map(string) 
  }))
}


variable "aws_private" {
  type = list(object({
    cidr_block = string
    availability_zones = string
    tags = map(string) 
  }))
}