# Terraform variables for AWS IoT Energy Monitoring System
# This file defines the variables used in the main Terraform configuration

variable "region" {
  description = "The AWS region to deploy resources to"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to store data"
  default     = "my-iot-bucket"
}

variable "kms_key_name" {
  description = "The name of the KMS key for encryption"
  default     = "my-iot-kms-key"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function for processing"
  default     = "iot-energy-monitoring"
}
