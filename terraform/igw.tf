resource "aws_internet_gateway" "wanderpeak" {
  vpc_id = aws_vpc.wanderpeak.id

  tags = {
    Name = "wanderpeak-igw"
  }
}