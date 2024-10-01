resource "aws_vpc" "base" {
  cidr_block = var.aws_vpc.cidr_block
  enable_dns_hostnames = var.aws_vpc.enable_dns_hostnames
  tags = var.aws_vpc.tags 
  
}

resource "aws_subnet" "public" {
  count = length(var.aws_public)
  vpc_id = aws_vpc.base.id
  cidr_block = var.aws_public[count.index].cidr_block
  availability_zone = var.aws_public[count.index].availability_zones
  tags = var.aws_public[count.index].tags 
  depends_on        = [aws_vpc.base]
}


resource "aws_subnet" "private" {
  count = length(var.aws_private)
  vpc_id = aws_vpc.base.id
  cidr_block = var.aws_private[count.index].cidr_block
  availability_zone = var.aws_private[count.index].availability_zones
  tags = var.aws_private[count.index].tags 
  depends_on        = [aws_vpc.base]
}

resource "aws_internet_gateway" "internet" {
  count = local.do_we_have_public_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "ntier_gateway"
  }
}
resource "aws_route_table" "public_routetable" {
  count = local.do_we_have_public_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "public"
}
}

resource "aws_route_table_association" "public_routetable_associate" {
  count = length(var.aws_public)
  route_table_id = aws_route_table.public_routetable[0].id
  subnet_id = aws_subnet.public[count.index].id
}

resource "aws_route" "internet" {
  count                  = local.do_we_have_public_subnets ? 1 : 0
  route_table_id         = aws_route_table.public_routetable[0].id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.internet[0].id
}

resource "aws_route_table" "private_routetable" {
  count = local.do_we_have_private_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "private_routetable_associate" {
  count = length(var.aws_private)
  route_table_id = aws_route_table.private_routetable[0].id
  subnet_id = aws_subnet.private[count.index].id
}