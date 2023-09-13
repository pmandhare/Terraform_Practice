terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "pooja" {
  key_name   = "ismail"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpLaGrrG4gaVhfbbLMvOgM+kJSFEjwBpTjAlSNU6MjXvpmJJ/5z4AedpmanjZHjejkRoA3xVn9xb9v9o+AhozWFtJV0d7cjSDJsFpLAiSuW6yQZ+9uGbIrVKjwqDpaJ6ZEectDYkZxW2CRw5fdaXJGNeCK1nTmtiW9k08sTyo2KWVxJOF07idIPiKDDk8KQXMamE/cgzg4QyONpaGvlIBWlCMbZkteB/Jqp8k7LY/xbjn1PfG/wlTHTI0ItXSaHfB+sQkMZGZidIF5QhPr2eTf345asBaXC/X6pJnziYDo4OZmEQ4gZbPpRPGu5e4k92Wb2xxH/OdfgP7Q63kHbcR9ZI3qjKbme2Y/fRntykx6aIvGSlavZ52KDKrcol8j3ZwqlRUHtr+H/z80yWH/qeTaijuWFBtn9fm2UXA4F5JcHy3xH11obGGuMusaS5ljrbArU85CYvsPFw7IODuz8vCcYmQEsvpEQKMmy+qOscPOuDBjmcXUw2KiTqzahPvEG80="
}
resource "aws_instance" "myec1123" {
  count         = 3
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.pooja.key_name  
}