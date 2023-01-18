// Virtual private cloud (sets up our networks in AWS so we can communicate with the outside world) 
resource "aws_vpc" "aws-vpc" {
  cidr_block            = "10.10.0.0/16" # Give a quick brief on what a CIDR block is and a resource related to it
  # The Amazon DNS server is an Amazon Route 53 Resolver server. 
  # This server enables DNS for instances that need to communicate over the VPC's internet gateway.
  # To learn more https://docs.aws.amazon.com/vpc/latest/userguide/vpc-dns.html
  enable_dns_hostnames  = true
  enable_dns_support    = true
  tags = { # Redefine tag game (name and env only)
    Name                = "${var.app_name}-vpc"
    environment         = var.app_environment
  }
}
