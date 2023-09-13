variable "vpc_cidr_block" {
    type = string
}

variable "availability_zone" {
    type = list
}

variable "public_subnet_cidr" {
    type = list
}

variable "private_subnet_cidr" {
    type = list
}

variable "destination_cidr_block" {
    type = string
}