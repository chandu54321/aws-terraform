module "aws_vpc" {
  source = "./example/vpc"
  aws_vpc = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "terraform"
    }
  }
  aws_public = [{
    cidr_block         = "10.0.1.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "web-1"
    }
  }]
  aws_private = [{
    cidr_block         = "10.0.2.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "app-1"
    }
  }]
}