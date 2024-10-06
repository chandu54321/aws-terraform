module "aws_vpc" {
  source = "git::https://github.com/chandu54321/aws-terraform.git//modules_terraform/example/vpc/"
  aws_vpc = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "terr"

    }
  }
  aws_public = [{
    cidr_block         = "10.0.1.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "web-1"
    }
    }, {
    cidr_block         = "10.0.2.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "app-1"
    } }
  ]
  aws_private = [{
    cidr_block         = "10.0.3.0/24"
    availability_zones = "ap-south-1a"
    tags = {
      Name = "db-1"
    }
  }]

}

resource "aws_security_group" "openhttp" {
  name        = "openhttp-tf"
  description = "openhttp"
  vpc_id      = module.aws_vpc.aws_vpc
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "openhttp-tf"
  }
}


resource "aws_instance" "insta" {
  ami                         = "ami-0dee22c13ea7a9a67"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.openhttp.id]
  associate_public_ip_address = true
  subnet_id                   = module.aws_vpc.aws_subnet_public[0]
  key_name                    = "keys"
  user_data                   = file("browny.sh")
}

resource "null_resource" "test" {
  triggers = {
    build_id = var.build_id
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.insta.public_ip
  }
  provisioner "remote-exec" {
    script = "./browny.sh"
  }
}