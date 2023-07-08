# terraform {
#   backend "s3" { 
#     bucket = data.aws_s3_bucket.tfstate                   # backend로 사용할 S3 버킷명
#     key = "terraform/vpc/terraform.tfstate"               # S3 버킷 내 tfstate파일 위치 경로 설정
#     region = "ap-northeast-2"                             # S3 버킷이 위치한 리전
#     encrypt = true                                        # tfstate 파일 암호화
#     dynamodb_table = data.aws_dynamodb_table.name         # Lock에 사용되는 DynamoDB Table명
#   }
# }