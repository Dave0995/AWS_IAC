output "vpc_id" {
  value = aws_vpc.dave_vpc.id
}

output "security_group_id" {
  value = aws_security_group.dave_security_group.id
}