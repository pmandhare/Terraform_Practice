locals {
  common_tags = {
    user = "vpc_USER"
  }
}

#VPC CREATION 
resource "aws_vpc" "this-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  tags             = local.common_tags
}

# CREATE private subnets 
resource "aws_subnet" "this-subnet-private01" {
  vpc_id                  = aws_vpc.this-vpc.id
  cidr_block              = var.private_subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  tags                    = local.common_tags
}

resource "aws_subnet" "this-subnet-private02" {
  vpc_id                  = aws_vpc.this-vpc.id
  cidr_block              = var.private_subnet_cidr[1]
  availability_zone       = var.availability_zone[1]
  tags                    = local.common_tags
}


# CREATE public subnets 
resource "aws_subnet" "this-subnet-public01" {
  vpc_id                  = aws_vpc.this-vpc.id
  cidr_block              = var.public_subnet_cidr[0]
  availability_zone       = var.availability_zone[0]
  tags                    = local.common_tags
}

resource "aws_subnet" "this-subnet-public02" {
  vpc_id                  = aws_vpc.this-vpc.id
  cidr_block              = var.public_subnet_cidr[1]
  availability_zone       = var.availability_zone[1]
  tags                    = local.common_tags
}


#Create IGW 
resource "aws_internet_gateway" "this-igw" {
  vpc_id = aws_vpc.this-vpc.id
  tags   = local.common_tags

}

#Create Elastic IP
resource "aws_eip" "this-eip" {
 
  tags = local.common_tags
}


#create Public NAT Gateway
resource "aws_nat_gateway" "this-nat" {
  allocation_id = aws_eip.this-eip.id
  subnet_id     = aws_subnet.this-subnet-public01.id
  tags          = local.common_tags
}


#public and private Route Table
resource "aws_route_table" "this-RT-public" {
  vpc_id = aws_vpc.this-vpc.id
  tags   = local.common_tags
}

resource "aws_route_table" "this-RT-private" {
  vpc_id = aws_vpc.this-vpc.id
  tags   = local.common_tags
}


#PUBLIC AND PRIVATE ROUTE  [IG AND NAT]
resource "aws_route" "this-route-public" {
  route_table_id         = aws_route_table.this-RT-public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.this-igw.id
}

resource "aws_route" "this-route-private" {
  route_table_id         = aws_route_table.this-RT-private.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_nat_gateway.this-nat.id
}

#Route Table Association
resource "aws_route_table_association" "this-RTAS-public" {
  subnet_id      = aws_subnet.this-subnet-public01.id
  route_table_id = aws_route_table.this-RT-public.id
}

resource "aws_route_table_association" "this-RTAS-private" {
  subnet_id      = aws_subnet.this-subnet-private01.id
  route_table_id = aws_route_table.this-RT-private.id
}