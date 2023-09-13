
# VPC CREATION 
resource "aws_vpc" "this-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default" 
}

# CREATE public subnets 
resource "aws_subnet" "this-subnet-public01" {
  vpc_id                  = aws_vpc.this-vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
}


# Create IGW 
resource "aws_internet_gateway" "this-igw" {
  vpc_id = aws_vpc.this-vpc.id
}

#Public and Route Table
resource "aws_route_table" "this-RT-public" {
  vpc_id = aws_vpc.this-vpc.id
}



# PUBLIC ROUTE  
resource "aws_route" "this-route-public" {
  route_table_id         = aws_route_table.this-RT-public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.this-igw.id
}


#Route Table Association
resource "aws_route_table_association" "this-RTAS-public" {
  subnet_id      = aws_subnet.this-subnet-public01.id
  route_table_id = aws_route_table.this-RT-public.id
}

// ssh key
resource "aws_key_pair" "loginkey" {
  key_name   = "loginkey"
   public_key = file("~/.ssh/id_rsa.pub")
}


// security group

resource "aws_security_group" "this_my_sg" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.this-vpc.id

  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.this-vpc.cidr_block]
  }
}
 
  // create ec2 instance
  resource "aws_instance" "this_my_ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.loginkey.key_name
  
}

