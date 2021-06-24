/* Network description */
resource "aws_vpc" "sgc-vpc" {
  cidr_block = var.vpcCidr
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

resource "aws_subnet" "sgc-subnet" {
  vpc_id = aws_vpc.sgc-vpc.id
  cidr_block = var.cidr
  availability_zone = var.aZone
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

/* Gateway description */
resource "aws_internet_gateway" "sgc-igw" {
  vpc_id = aws_vpc.sgc-vpc.id
  tags = {
    Name = "something"
    Project = "Super project"
  }
}

resource "aws_route" "sgc-route" {
  route_table_id = aws_vpc.sgc-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.sgc-igw.id
}
