data "aws_vpc" "terraform_study_vpc" { 
  tags = {
    Name = "terraform-study-vpc" 
  }
}
data "aws_subnet" "public_subnet_2a" {
  tags = {
    Name = "public-subnet-2a" 
  }
}