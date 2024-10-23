resource "aws_vpc" "kind" {
        cidr_block = var.aws_vpc.cidr_block
  enable_dns_hostnames = var.aws_vpc.enable_dns_hostnames
  tags = var.aws_vpc.tags
}