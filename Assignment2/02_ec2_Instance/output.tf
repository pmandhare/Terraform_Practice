output "public-ip" {
  value = aws_instance.this_my_ec2.public_ip
}

output "public-dns" {
  value = aws_instance.this_my_ec2.public_dns
}

output "private-ip" {
  value = aws_instance.this_my_ec2.private_ip
}

output "private-dns" {
  value = aws_instance.this_my_ec2.private_dns
}