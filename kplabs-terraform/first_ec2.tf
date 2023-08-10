provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6E3O5Z3XUSYF77GT"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-072ec8f4ea4a6f2cf"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-ec2"
  }
}

resource "aws_instance" "web1"{
  ami           = "ami-072ec8f4ea4a6f2cf"
  instance_type = "t2.micro"
}