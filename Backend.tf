terraform {
  backend "s3" {
    bucket = ""
    key    = "vpc/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = ""
    encrypt = true
  }
}