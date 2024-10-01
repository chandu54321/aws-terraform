output "aws_vpc" {
  value = aws_vpc.base.id
}

output "aws_subnet_public" {
  value = aws_subnet.public[*].id
}

output "aws_subnet_private" {
  value = aws_subnet.private[*].id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.internet[*].id
}

output "aws_route_public" {
  value = aws_route_table.public_routetable[*].id
}

output "aws_routetable_ass" {
  value = aws_route_table_association.public_routetable_associate[*].id
}

output "aws_routetable_assoc" {
  value = aws_route_table_association.private_routetable_associate[*].id
}


output "aws_route_private" {
  value = aws_route_table.private_routetable[*].id
}
