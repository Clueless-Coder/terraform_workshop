

resource "aws_iam_user" "terra_user_lb" {
    name = var.list[count.index]
    count = 3
    path = "/system/"
}

variable "list" {
    type = list
    default = ["dev_loadbalancer","uat_loadbalancer","prod_loadbalancer"]
  
}