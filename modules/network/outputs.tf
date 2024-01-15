output "vpc_id" {
  value = aws_vpc.dave_vpc.id
}

output "security_group_id" {
  value = aws_security_group.dave_security_group.id
}

output "private_subnets_id" {
  value = [aws_subnet.dave_private_subnet_1.id, aws_subnet.dave_private_subnet_2.id]
}