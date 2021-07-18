provider "aws" {
    region = "us-west-2"
    access_key = "abcd"
    secret_key = "abcd"
  
}

resource "aws_eip" "terra_lb" {
    vpc = true
  
}

output "eip" {
    value = aws_eip.terra_lb.public_ip
  
}

resource "aws_s3_bucket" "terra_s3" {
    bucket = "terra-s3-attribute"
  
}

output "s3_attribute" {
    value = aws_s3_bucket.terra_s3.bucket_domain_name
  
}

