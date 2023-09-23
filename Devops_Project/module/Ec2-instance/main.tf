
resource "aws_instance" "m_aws_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.Subnet_id
}
