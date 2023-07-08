#==============================================================================================================================
# 2023-07-02 예진
# [create]
# 1. S3 Bucket 
# 2. DynamoDB Table
# 3. output, data block - S3 bucket + DynamoDB 생성된 후  Backend에서 참조
#==============================================================================================================================


#==============================================================================================================================
# 1. S3 
#==============================================================================================================================
resource "aws_s3_bucket" "tfstate"{ 
  bucket = "20230702-terraform-study-tfstate"
}

resource "aws_s3_bucket_versioning" "versioning_tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

#==============================================================================================================================
# 2. DynamoDB table 생성
#==============================================================================================================================
resource "aws_dynamodb_table" "terraform_state_lock" {
  name= "TerraformStateLock" 
  hash_key = "LockID" 
  billing_mode = "PAY_PER_REQUEST"
  attribute{ 
  name = "LockID"
  type = "S"
  }
}

#==============================================================================================================================
# 3. output, data block -  S3 bucket + DynamoDB 생성된 후  Backend에서 참조
#==============================================================================================================================
output "aws_s3_bucket" {
  value = aws_s3_bucket.tfstate
  
}
output "aws_dynamodb_table" {
  value = aws_dynamodb_table.terraform_state_lock
  
}
data "aws_s3_bucket" "tfstate" {
  bucket = "20230702-terraform-study-tfstate" 
}
data "aws_dynamodb_table" "terraform_state_lock" {
  name = "TerraformStateLock" 
}