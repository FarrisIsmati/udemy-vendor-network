resource "aws_nat_gateway" "public_subnet" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.public[0].id

  tags = {
    Name                = "${var.app_name}-nat"
    udemy                = ""
    vendor               = ""
    natgateway               = ""
  }

  depends_on = [
    aws_internet_gateway.aws-igw
  ]
}
