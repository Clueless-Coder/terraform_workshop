provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"  
  
}

resource "aws_instance" "terra_ref_ec2" {
    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.micro"
}

resource "aws_eip" "terra_ref_lb" {
    vpc = "true"
  
}

resource "aws_eip_association" "terra_ref_eip_assoc" {
    instance_id = aws_instance.terra_ref_ec2.id
    allocation_id = aws_eip.terra_ref_lb.id
}

resource "aws_security_group" "terra_ref_sg" {
    name = "terra_ref_sg"

    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.terra_ref_lb.public_ip}/32"]
    }
  
}