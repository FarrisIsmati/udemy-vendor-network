resource "aws_nat_gateway" "public_subnet_1" {
  allocation_id = aws_eip.nat_1.id
  subnet_id = aws_subnet.public[0].id

  tags = {
    Name                 = "${var.app_name}-nat1"
    udemy                = ""
    vendor               = ""
    natgateway           = ""
  }

  depends_on = [
    aws_internet_gateway.aws-igw
  ]
}

resource "aws_nat_gateway" "public_subnet_2" {
  allocation_id = aws_eip.nat_2.id
  subnet_id = aws_subnet.public[1].id

  tags = {
    Name                 = "${var.app_name}-nat2"
    udemy                = ""
    vendor               = ""
    natgateway           = ""
  }

  depends_on = [
    aws_internet_gateway.aws-igw
  ]
}
