resource "aws_eip" "nat_1" {
    depends_on = [
      aws_internet_gateway.aws-igw
    ]
}

resource "aws_eip" "nat_2" {
    depends_on = [
      aws_internet_gateway.aws-igw
    ]
}