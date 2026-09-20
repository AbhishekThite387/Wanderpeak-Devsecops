resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.wanderpeak.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "wanderpeak-public-a"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.wanderpeak.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "wanderpeak-public-b"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.wanderpeak.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "wanderpeak-private-a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.wanderpeak.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "wanderpeak-private-b"
  }
}