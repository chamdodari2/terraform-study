# Terraform: Study 1주차
---
~~~
# 1주차 과제 수행 
├── 01.backend # remote백엔드용 AWS S3/DynamoDB 생성 
├── 02.vpc # vpc 생성
└── 03.ec2 # EC2 웹 서버 배포
~~~


01.backend

 - main.tf
   - S3 Bucket, DynamoDB Table 생성
   - Output block으로 리소스 생성 확인


02.vpc
- backend.tf
  - remote backend 사용 (S3,dynamodb)
 - main.tf
   -  VPC, Internet Gateway, Route Table 생성
 - output.tf
   - vpc.id, subnet.id값 확인 및 ec2 생성시 값 참조할수 있도록 함 

03.ec2
 - data.tf
   - vpc id, subnet id 값 참조 
 - main.tf
   -  sg(80 port), ec2(ubuntu) 생성
 - output.tf
   - 생성된 ec2.id값 확인
 - user-data-test-instance.sh
   - ec2 userdata (httpd 설치 및 "dodary-Yeji" 출력되도록 함)
  

# 결과
1.ec2의 public ip로 접속시
<img width="430" alt="image" src="https://github.com/chamdodari2/terraform-study/assets/78536511/976762d4-eada-4b3c-823f-51b05d0fd494">
