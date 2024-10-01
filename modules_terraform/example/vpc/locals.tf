locals {
  do_we_have_public_subnets  = length(var.aws_private) > 0
  do_we_have_private_subnets = length(var.aws_public) > 0
  anywhere                   = "0.0.0.0/0"
}