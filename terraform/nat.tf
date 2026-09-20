resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "wanderpeak-nat-eip"
  }
}

resource "aws_nat_gateway" "wanderpeak" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "wanderpeak-nat"
  }

  depends_on = [
    aws_internet_gateway.wanderpeak
  ]
}
