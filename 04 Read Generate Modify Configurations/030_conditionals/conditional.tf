provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}


variable "istest" {
  
}

resource "aws_instance" "terra_condition_ec2_dev" {
    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.micro"
    count = var.istest == true ? 1 : 0
  
}

resource "aws_instance" "terra_condition_ec2_prod" {
    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.large"
    count = var.istest == false ? 1 : 0
  
}