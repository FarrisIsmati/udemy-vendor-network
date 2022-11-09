# Public RT
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

# Private RT
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.aws-vpc.id

  tags = {
    Name                = "${var.app_name}-private-rt"
    udemy                = ""
    vendor               = ""
    rt                   = ""
  }
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id     = aws_nat_gateway.public_subnet.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
