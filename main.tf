provider "aws" {
  region = "us-east-1" # Asegúrate que tu región permite t2.micro
}

data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro" # O usa "t3.micro" si es necesario

  tags = {
    Name = "HelloWorld"
  }
}
