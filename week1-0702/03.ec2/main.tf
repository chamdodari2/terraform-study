#==============================================================================================================================
# 2023.07.02 - 예진
# 1. SG
# 2. EC2
# 3. Output - ec2 id
#==============================================================================================================================


#==============================================================================================================================
# SG
#==============================================================================================================================
resource "aws_security_group" "test_instance_sg" { 
  name   = "test-instance-sg"
  description = "test-instance-sg"
  vpc_id = data.aws_vpc.terraform_study_vpc.id
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }    
}
#==============================================================================================================================
# ec2
#==============================================================================================================================

resource "aws_instance" "test_instance" {
  ami                           = "ami-0e9bfdb247cc8de84"  #Ubuntu 22.04 LTS 사용
  instance_type                 = "t2.micro"
  subnet_id                     =  "${data.aws_subnet.public_subnet_2a.id}"
  vpc_security_group_ids        = ["${aws_security_group.test_instance_sg.id}"]
  key_name                      = "terraform-study-server-key"
  associate_public_ip_address   = true
  user_data                     = file("user-data-test-instance.sh") 
  tags = {
  Name = "test-instance"
  }
}

