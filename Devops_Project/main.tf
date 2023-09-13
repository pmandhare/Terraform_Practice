module "ec2_instance" {
source = "./module/ec2"
m_ami_id = var.l_ami_id 
m_type   = var.l_type
m_keyname = module.ssh.ssh_keyname
}

module "ssh" {
source = "./module/ssh"
m_keyname  = var.l_keyname
m_public_key_path = var.l_public_key_path
}

module "sg" {
source = "./module/sg"
m_name = var.l_name
m_sg_ports = var.l_sg_ports
m_cidr_blocks = var.l_cidr_blocks
}