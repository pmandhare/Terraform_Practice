resource "aws_security_group" "Sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id
  
  dynamic "ingress" {
    for_each = var.Sg_ports
    iterator = port
    content {
    description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = var.Cidr_blocks
    } 
  }

  dynamic "egress" {
    for_each = var.Sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.Cidr_blocks
    }
  }

}

