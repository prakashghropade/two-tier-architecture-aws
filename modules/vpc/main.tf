# VPC module

resource "aws_vpc" "main" {
cidr_block = var.vpc_cider
enable_dns_hostnames = true
enable_dns_support = true

tags = {
  Name = "${var.project_name}-vpc"
  Environment = var.environment
}
}

# Public subnets
resource "aws_subnet" "pubic" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_ciders
    map_public_ip_on_launch = true
    availability_zone = "${var.aws_region}a"

    tags = {
      Name = "${var.project_name}-public-subnet"
      Environment = var.environment
    }

}

# private subnets for RDS ( requires at least 2 azs )
resource "aws_subnet" "private_1" {
 vpc_id = aws_vpc.main.id
 cidr_block = var.private_subnet_ciders[0]
 availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-private-subnet-1"
    Environment = var.environment
  }
}

# private subnet 2
resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_ciders[1]
    availability_zone = "${var.aws_region}b"

    tags = {
      Name = "${var.project_name}-private-subnet-2"
      Environment = var.environment
    }
}

# Internet gatway
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "${var.project_name}-igw"
      Environment = var.environment
    }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id =  aws_vpc.main.id

  route  {
    gateway_id = aws_internet_gateway.main.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "${var.project_name}-public-rt"
    Environment = var.environment
  }
}

# Route table association
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.pubic.id
    route_table_id = aws_route_table.public.id
  
}

