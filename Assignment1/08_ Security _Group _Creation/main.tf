
resource "aws_security_group" "my_sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-03a9ac708775b7d4b"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
     
  }
}
  resource "aws_instance" "myec22" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.my_sg.name] 
}

