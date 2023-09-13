
resource "aws_instance" "m_aws_instance" {
  ami           = var.m_ami_id
  instance_type = var.m_type
  key_name = var.m_keyname
}

