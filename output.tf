# Terraform output file for the AWS IoT module
# This file defines the outputs for the main Terraform configuration
output "bucket_name" {
  value = module.my_iot_bucket_1106.bucket_name
}



output "kms_key_id" {
  value = module.iot_kms_key.key_id
}

output "lambda_function_name" {
  value = module.iot_lambda.lambda_function_name
}
