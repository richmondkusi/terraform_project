# vpc creation
resource "aws_vpc" "Prod-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "Prod-vpc"
  }
}


# Public subnet1
resource "aws_subnet" "Prod-pub-sub1" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.pub_sub1_cidr
  availability_zone = var.az1

  tags = {
    Name = "Prod-pub-sub1"
  }
}

# Public subnet2
resource "aws_subnet" "Prod-pub-sub2" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.pub_sub2_cidr
  availability_zone = var.az1

  tags = {
    Name = "Prod-pub-sub2"
  }
}

# Private subnet1
resource "aws_subnet" "Prod-priv-sub1" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.priv_sub1_cidr
  availability_zone = var.az2

  tags = {
    Name = "Prod-priv-sub1"
  }
}

# Private subnet2
resource "aws_subnet" "Prod-priv-sub2" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.priv_sub2_cidr
  availability_zone = var.az2

  tags = {
    Name = "Prod-priv-sub2"
  }
}


# Creating a public route table

resource "aws_route_table" "Prod-pub-RT" {
  vpc_id = aws_vpc.Prod-vpc.id

  route = []

  tags = {
    Name = "Prod-pub-RT"
  }
}

# public route table association1

resource "aws_route_table_association" "Pub-sub-assoc1" {
  subnet_id      = aws_subnet.Prod-pub-sub1.id
  route_table_id = aws_route_table.Prod-pub-RT.id
}

# public route table association2

resource "aws_route_table_association" "Pub-sub-assoc2" {
  subnet_id      = aws_subnet.Prod-pub-sub2.id
  route_table_id = aws_route_table.Prod-pub-RT.id
}

# Creating a private route table

resource "aws_route_table" "Prod-priv-RT" {
  vpc_id = aws_vpc.Prod-vpc.id

  route = []

  tags = {
    Name = "Prod-priv-RT"
  }
}

# private route table association1

resource "aws_route_table_association" "Priv-sub-assoc1" {
  subnet_id      = aws_subnet.Prod-priv-sub1.id
  route_table_id = aws_route_table.Prod-priv-RT.id
}

# private route table association2
resource "aws_route_table_association" "Priv-sub-assoc2" {
  subnet_id      = aws_subnet.Prod-priv-sub2.id
  route_table_id = aws_route_table.Prod-priv-RT.id
}

# creating internet gateway
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = "${aws_vpc.Prod-vpc.id}"

  tags = {
    Name = "Prod-igw"
  }
}

# internet gateway association
resource "aws_route" "Prod-IGW-Association" {
  route_table_id            = aws_route_table.Prod-pub-RT.id
  gateway_id = aws_internet_gateway.Prod-igw.id
  destination_cidr_block    = "0.0.0.0/0"
}

# creation of server1
resource "aws_instance" "Rock-server1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.Prod-pub-sub1.id
  availability_zone = var.az1


  tags = {
    Name = "Rock-server1"
  }
}

# creation of server2
resource "aws_instance" "Rock-server2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.Prod-priv-sub1.id
  associate_public_ip_address = "true"
  availability_zone = var.az2


  tags = {
    Name = "Rock-server2"
  }
}

