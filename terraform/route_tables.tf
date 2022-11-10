# Public RT 1
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-public-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.aws-igw.id
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

# Private RT 1
resource "aws_route_table" "private_subnet_1" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-private-1-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "private_subnet_1" {
  route_table_id         = aws_route_table.private_subnet_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id     = aws_nat_gateway.public_subnet_1.id
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private_subnet_1.id
}

# Private RT 2
resource "aws_route_table" "private_subnet_2" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-private-2-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private_subnet_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id     = aws_nat_gateway.public_subnet_2.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private[1].id
  route_table_id = aws_route_table.private_subnet_2.id
}

