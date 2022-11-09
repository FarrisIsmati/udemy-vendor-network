resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.aws-vpc.id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  count                   = length(var.public_subnets)
  map_public_ip_on_launch = true

  tags = {
    Name                = "${var.app_name}-public"
    udemy                = ""
    vendor               = ""
    subnet               = ""
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.aws-vpc.id
  count             = length(var.private_subnets)
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name                = "${var.app_name}-private"
    udemy                = ""
    vendor               = ""
    subnet               = ""
  }
}

## NOT HA

# resource "aws_subnet" "public_1" {
#   vpc_id                  = aws_vpc.aws-vpc.id
#   cidr_block              = element(var.public_subnets, count.index)
#   availability_zone       = element(var.availability_zones, count.index)
#   count                   = length(var.public_subnets)
#   map_public_ip_on_launch = true

#   tags = {
#     Name                = "${var.app_name}-public"
#     udemy                = ""
#     vendor               = ""
#     subnet               = ""
#   }
# }

# resource "aws_subnet" "private_1" {
#   vpc_id            = aws_vpc.aws-vpc.id
#   count             = length(var.private_subnets)
#   cidr_block        = element(var.private_subnets, count.index)
#   availability_zone = element(var.availability_zones, count.index)

#   tags = {
#     Name                = "${var.app_name}-private"
#     udemy                = ""
#     vendor               = ""
#     subnet               = ""
#   }
# }
