variable "aws_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr range"
}
variable "aws_subnets" {
  type        = list(string)
  default     = ["app-1", "app-2", "app-3", "app-3"]
  description = "subnet names"
}
variable "aws_subnet_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "subnets cidr ranges"
}
variable "aws_vpc_name" {
  type        = string
  default     = "tofel"
  description = "name of vpc"
}
