// Virtual private cloud (sets up our networks in AWS so we can communicate with the outside world) 
resource "aws_vpc" "aws-vpc" {
  cidr_block            = "10.10.0.0/16" # Give a quick brief on what a CIDR block is and a resource related to it
  enable_dns_hostnames  = true
  enable_dns_support    = true
  tags = { # Redefine tag game (name and env only)
    name                = "${var.app_name}-vpc"
    environment         = var.app_environment
  }
}
