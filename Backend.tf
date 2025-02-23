terraform {
  backend "s3" {
    bucket = "aws-sucks-but-i-like-terraformt2"
    key    = "vpc/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "Terraform-Locktf"
    encrypt = true
  }
}