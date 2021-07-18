provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd" 
}

resource "aws_instance" "terra_fetch_ec2" {
    ami = "ami-0800fc0fa715fdcfe"
#    instance_type = var.types["ap-south-1"]
    instance_type = var.list[1]
  
}

variable "list" {
    type = list
    default = ["m5.large","m5.xlarge","t2.medium"]
  
}

variable "types" {
    type = map
    default = {
        us-east-1 = "t2.micro"
        us-west-2 = "t2.nano"
        ap-south-1 = "t2.small"
    }
  
}