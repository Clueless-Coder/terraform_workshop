provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
}

variable "sg_ports" {
    type = list(number)
    default = [ 8442,8080,9190,9090 ]
}

resource "aws_security_group" "terra_dynamicsg" {
    name = "dynamic_sg"
    description = "ingress for vault"

    dynamic "ingress"  {
        for_each =var.sg_ports
        content {
            cidr_blocks = [ "0.0.0.0/0" ]
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
        }  
    } 
  
}