provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}

data "aws_ami" "terra_datasource_ami"{
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_instance" "terra_datasource_ec2" {
    ami = data.aws_ami.terra_datasource_ami.id
    instance_type = "t2.micro"
}