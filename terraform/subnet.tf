resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = "${var.project}-private-${each.key}"
  }
}
