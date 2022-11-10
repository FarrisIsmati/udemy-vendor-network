# Public RT 1
resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-public-1-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "public_rt_1" {
  route_table_id         = aws_route_table.public_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.aws-igw.id
}

resource "aws_route_table_association" "public_rt_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_rt_1.id
}

# Public RT 2
resource "aws_route_table" "public_rt_2" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-public-2-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "public_rt_2" {
  route_table_id         = aws_route_table.public_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.aws-igw.id
}

resource "aws_route_table_association" "public_rt_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public_rt_2.id
}

# Private RT 1
resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-private-1-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "private_rt_1" {
  route_table_id         = aws_route_table.private_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id     = aws_nat_gateway.public_subnet_1.id
}

resource "aws_route_table_association" "private_rt_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_rt_1.id
}

# Private RT 2
resource "aws_route_table" "private_rt_2" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-private-2-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "private_rt_2" {
  route_table_id         = aws_route_table.private_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id     = aws_nat_gateway.public_subnet_2.id
} 

resource "aws_route_table_association" "private_rt_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private_rt_2.id
}

