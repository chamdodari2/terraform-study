#==============================================================================================================================
# 2023.07.02 - 예진
# 1. VPC
# 2. Internet Gateway
# 3. Route Table
#==============================================================================================================================




#==============================================================================================================================
# 1. VPC
#==============================================================================================================================
resource "aws_vpc" "terraform_study_vpc" { 
  cidr_block  = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  tags = {
    Name = "terraform-study-vpc" 
  }
}
#==============================================================================================================================
# 2. Internet Gateway
#==============================================================================================================================
resource "aws_internet_gateway" "terraform_study_igw" {
  vpc_id = aws_vpc.terraform_study_vpc.id
  tags = {
    Name = "terraform-study-vpc-igw"
  }
}
#==============================================================================================================================
# 2. Subnet - public subnet 2a
#==============================================================================================================================
resource "aws_subnet" "public_subnet_2a" { 
  vpc_id = aws_vpc.terraform_study_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0] 
  tags = {
    Name = "public-subnet-2a"
  }
}


#==============================================================================================================================
# Route Table  - Public
#==============================================================================================================================
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_study_vpc.id
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_subnet_2a_association" { 
  subnet_id = aws_subnet.public_subnet_2a.id  
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route" "public_rt_route" {
  route_table_id            = "${aws_route_table.public_rt.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = "${aws_internet_gateway.terraform_study_igw.id}"
#   depends_on                = [aws_internet_gateway.terraform_study_igw.id,aws_route_table.public_rt]

}
#==============================================================================================================================
# VPC END
#==============================================================================================================================

