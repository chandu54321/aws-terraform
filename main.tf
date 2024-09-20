resource "aws_vpc" "test" {
  cidr_block = var.aws_cidr
  tags = {
    Name = var.aws_vpc_name
  }
}
resource "aws_subnet" "kest1" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.aws_subnet_cidr[0]
  tags = {
    Name = var.aws_subnets[0]
  }
}
resource "aws_subnet" "kest2" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.aws_subnet_cidr[1]
  tags = {
    Name = var.aws_subnets[1]
  }
}
resource "aws_subnet" "kest3" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.aws_subnet_cidr[2]
  tags = {
    Name = var.aws_subnets[2]
  }
}
resource "aws_subnet" "kest4" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.aws_subnet_cidr[3]
  tags = {
    Name = var.aws_subnets[3]
  }
}
