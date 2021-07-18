provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"

}

resource "aws_instance" "terra_varsdemo_ec2" {
    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.micro"
  
}

resource "aws_eip" "terra_varsdemo_lb" {
    vpc = "true"
  
}

resource "aws_eip_association" "terra_varsdemo_eip_assoc" {
    instance_id = aws_instance.terra_varsdemo_ec2.id
    allocation_id = aws_eip.terra_varsdemo_lb.id
  
}

resource "aws_security_group" "terra_varsdemo_sg" {
    name = "terra_varsdemo_sg"

    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.vpn_ip]
    }

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.vpn_ip]
    }

    ingress{
        from_port = 53
        to_port = 53
        protocol = "tcp"
        cidr_blocks = [var.vpn_ip]
    }

}