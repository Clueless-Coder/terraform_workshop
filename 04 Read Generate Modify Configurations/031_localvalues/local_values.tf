provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}


locals {
    common_tags = {
        Owner = "Devops Team"
        service = "backend"
    }
}

resource "aws_instance" "terra_localvalues_ec2_appdev" {
    ami = ""
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "terra_localvalues_ec2_dbdev" {
    ami = ""
    instance_type = "t2.small"
    tags = local.common_tags
  
}

resource "aws_ebs_volume" "terra_localvalues_ebs" {
    availability_zone = "us-west-2a"
    size = 8
    tags = local.common_tags
}

