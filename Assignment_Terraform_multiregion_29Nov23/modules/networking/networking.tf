# create a vpc
resource "aws_vpc" "uneku_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
}

# create a internet gateway
resource "aws_internet_gateway" "uneku_igw" {
  vpc_id = aws_vpc.uneku_vpc.id
}

# create a public subnet
resource "aws_subnet" "uneku_public_subnet" {
  vpc_id                  = aws_vpc.uneku_vpc.id
  cidr_block              = var.public_cidr
  map_public_ip_on_launch = true
}


# create public route table
resource "aws_route_table" "pubic_route_table" {
  vpc_id = aws_vpc.uneku_vpc.id
}

#create default route 
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.pubic_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.uneku_igw.id
}

# create route table association for public subnert
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = aws_subnet.uneku_public_subnet.id
  route_table_id = aws_route_table.pubic_route_table.id

}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.uneku_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
