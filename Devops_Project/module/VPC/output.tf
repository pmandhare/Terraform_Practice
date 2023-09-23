output "public_subnet_id" {
  value = aws_subnet.public_subnets01[0].id
}

output "public_subnet_id2" {
  value = aws_subnet.public_subnets01[1].id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets01[0].id
}

output "private_subnet_id2" {
  value = aws_subnet.private_subnets01[1].id
}

output "my_vpc_id" {
  value = aws_vpc.MY_VPC.id
}