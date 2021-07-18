provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZ", timestamp())
}

variable "region" {
    default = "ap-south-1"
  
}

variable "tags" {
    type = list
    default = ["firstec2", "secondec2"]
  
}

variable "ami" {
    type = map
    default = {
        "us-east-1" = "ami-0800fc0fa715f7d"
        "us-west-2" = "ami-0800fc0fa715fdcfe"
        "ap-south-1" = "ami-0800fc0fa715fdc76"

    }
}

resource "aws_key_pair" "loginkey" {
    key_name = "terra_functions_loginkey"
public_key = file("C:/Users/sohit.malik/Downloads/id_rsa.pub")
}

resource "aws_instance" "terra_function_appdev" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = aws_key_pair.loginkey.key_name
    count = 2
    tags = {
        name = element(var.tags , count.index)
    }
}

output "timestamp" {

    value = local.time
  
}
