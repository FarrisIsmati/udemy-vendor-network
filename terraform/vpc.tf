// Virtual private cloud (sets up our networks in AWS so we can communicate with the outside world) 
resource "aws_vpc" "aws-vpc" {
  cidr_block            = "10.10.0.0/16"
  enable_dns_hostnames  = true
  enable_dns_support    = true
  tags = {
    Name                = "${var.app_name}-vpc"
    Environment         = var.app_environment
    udemy               = ""
    vendor              = ""
    vpc                 = ""
  }
}
