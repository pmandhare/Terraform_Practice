
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_dev" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"

}