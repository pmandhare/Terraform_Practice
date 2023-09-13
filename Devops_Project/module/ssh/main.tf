resource "aws_key_pair" "m_login" {
  key_name   = var.m_keyname
  public_key = file(var.m_public_key_path)
}