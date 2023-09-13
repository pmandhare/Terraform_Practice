locals {
    common_tags = {
        owner = "Devops Team"
        service = "backend"
    }
}


resource "aws_instance" "this_my_ec2" {
  ami           = var.ami_id
  instance_type = var.type 
  tags           = local.common_tags
}

resource "aws_eip" "this_lb" {
  instance = aws_instance.this_my_ec2.id
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this_my_ec2.id
  allocation_id = aws_eip.this_lb.id
}




