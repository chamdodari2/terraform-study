# Terraform: Study 1주차
---
~~~
# 1주차 과제 수행 
├── 01.backend # remote백엔드용 AWS S3/DynamoDB 생성 
├── 02.vpc # vpc 생성
└── 03.ec2 # EC2 웹 서버 배포
~~~


01. backend

 - main.tf
   - S3 Bucket, DynamoDB Table 생성
   - Output block으로 리소스 생성 확인


02. vpc
 - main.tf
   -  VPC, Internet Gateway, Route Table 생성
 - output.tf
   - vpc.id, subnet.id값 확인 및 ec2 생성시 값 참조할수 있도록 함 
03.ec2
 - main.tf
   -  sg(80 port), ec2 생성
 - output.tf
   - vpc.id, subnet.id값 확인 및 ec2 생성시 값 참조할수 있도록 함 