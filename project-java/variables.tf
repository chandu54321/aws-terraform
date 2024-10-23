variable "aws_vpc" {
 type = object({
  cidr_block = string
  enable_dns_hostnames = bool 
  tags = map(string)
})
  }