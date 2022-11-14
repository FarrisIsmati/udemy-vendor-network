# https://dev.to/thnery/create-an-aws-ecs-cluster-using-terraform-g80 

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.5.0"
    }
  }

  backend "s3" {} // this is called partial configuration https://developer.hashicorp.com/terraform/language/settings/backends/configuration#partial-configuration
}

provider "aws" {
    region = "us-east-1"
}
