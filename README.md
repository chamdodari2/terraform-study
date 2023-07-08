# Terraform: Study 1주차
---


1주차 도전과제 1번과 2번 수행하였습니다.
1) EC2 웹 서버 배포 배포
Ubuntu 에 apache(httpd) 를 설치하고 index.html 생성(닉네임 출력)하는 userdata 를 작성해서 설정 배포, 포트는 TCP 80 후 curl 접속 - 해당 테라폼 코드(파일)를 작성

2) AWS S3/DynamoDB 백엔드 구성

>Terraform “Backend” 는 Terraform의 state file을 어디에 저장을 하고, 가져올지에 대한 설정입니다.
>기본적으로는는 로컬 스토리지에 저장을 하지만, 설정을 통해 원격 저장소를 사용할 수 있습니다.
>원격 저장소를 사용할 경우의 장점은 아래와 같습니다.
>1) Backup: 로컬 스토리지에 저장한다는건 유실할 수 있다는 가능성을 내포합니다. S3와 같은 원격저장소를 사용함으로써 state 파일의 유실을 방지합니다.
>2) Locking: 보통 Terraform 코드를 혼자 작성하지 않습니다.원격 저장소를 사용함으로써 동시에 같은 state를 접근하는 것을 막아 의도치 않은 변경을 방지할 수 있습니다.
>본 실습에서는 terraform backend로 AWS S3와 DynamoDB를 사용하였습니다. 원격 저장소인 S3버킷에 .tfstate파일을 관리하며 DynamoDB를 함께 사용하여 여러 작업자가 동시에 인프라 상태를 변경하지 못하도록 합니다.


---
~~~  
# directory 설명
├── 01.backend # remote백엔드용 AWS S3/DynamoDB 생성 
├── 02.vpc # vpc 생성
└── 03.ec2 # EC2 웹 서버 배포
~~~

01.backend

 - main.tf
   - backend용 S3 Bucket, DynamoDB Table 생성 
   - Output block으로 리소스 생성 확인




02.vpc
- backend.tf
  - remote backend 사용 (S3,dynamodb)
 - main.tf
   -  VPC, Internet Gateway, Route Table 생성
 - output.tf
   - vpc.id, subnet.id값 확인 및 ec2 생성시 값 참조

03.ec2
 - data.tf
   - vpc id, subnet id 값 참조 
 - main.tf
   -  sg(80 port open), ec2(ubuntu) 생성
 - output.tf
   - 생성된 ec2.id값 확인
 - user-data-test-instance.sh
   - ec2 userdata (httpd 설치 및 "dodary-Yeji" 출력되도록 함)
  

# 결과
1.ec2의 public ip로 접속시
<img width="430" alt="image" src="https://github.com/chamdodari2/terraform-study/assets/78536511/976762d4-eada-4b3c-823f-51b05d0fd494">
