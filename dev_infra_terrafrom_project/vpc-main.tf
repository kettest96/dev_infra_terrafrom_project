resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/21"


  tags = {
    Name = "demo-vpc"
  }
}
#AWS SUBNET

resource "aws_subnet" "demo-subnet" {
  vpc_id            = aws_vpc.demo-vpc.id 
  #vpc_id                  = var.vpc_id
  cidr_block        = "10.0.0.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-subnet"
  }
}

#Internet gateway

resource "aws_internet_gateway" "demo-igw" {
  #vpc_id                  = var.vpc_id
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "demo-igw"
  }
}

#AWS ROUTE Table
resource "aws_route_table" "demo-rt" {
  #vpc_id                  = var.vpc_id
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }


  tags = {
    Name = "demo-rt"
  }
}

resource "aws_route_table_association" "demo-rt-association" {
    #subnet_id = var.subnet_id
  subnet_id      = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-rt.id
}
