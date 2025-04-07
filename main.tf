# Terraform Configuration for AWS IoT Core and S3 Bucket
# This Terraform configuration sets up an AWS IoT Core environment with an S3 bucket for data storage.
# It includes modules for creating an S3 bucket, a KMS key for encryption, and a Lambda function for processing IoT data.


# Module for S3 Bucket
module "my_iot_bucket_1106" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}

# Module for KMS Key
module "iot_kms_key" {
  source      = "./modules/kms"
  kms_key_name = var.kms_key_name
}

# Module for Lambda Function
module "iot_lambda" {
  source               = "./modules/lambda"
  lambda_function_name = var.lambda_function_name
  bucket_name          = module.my_iot_bucket_1106.bucket_name  
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name               = "lambda-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Effect    = "Allow"
    }]
  })
}

# # Outputs
# output "my_iot_bucket_1106_arn" {
#   value = module.my_iot_bucket_1106.bucket_arn
# }

# output "kms_key_id" {
#   value = module.iot_kms_key.key_id
# }
