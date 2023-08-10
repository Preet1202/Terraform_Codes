provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "web" {
  ami           = "ami-"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-ec2"
  }
}

resource "aws_instance" "web1"{
  ami           = "ami-"
  instance_type = "t2.micro"
}
