provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}

resource "aws_instance" "terra_count_instance1" {

    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.micro"
    count = 1
}
