resource "aws_security_group" "m_sg" {
  name        = var.m_name
  
  dynamic ingress {
    for_each = var.m_sg_ports
    iterator = port
    content{

    description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = var.m_cidr_blocks
    } 
  }


}