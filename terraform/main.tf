terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-running-state"
    key            = "example/terraform.tfstate"
    region         = "cn-north-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "cn-north-1"
}

# resource "aws_instance" "app_server" {
#   ami           = "ami-0ddcc204358e015fa"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }
