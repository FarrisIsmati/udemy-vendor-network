# replace with github actions secret
variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

# Will make this not a variable (don't add)
variable "aws_cloudwatch_retention_in_days" {
  type        = number
  description = "AWS CloudWatch Logs Retention in Days"
  default     = 1
}

variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "udemy-vendor"
}

# Will not include (just used in tags)
variable "app_environment" {
  type        = string
  description = "Application Environment"
  default     = "development"
}

# range of IP addresses we will use for public subnets (won't go into CIDR block ranges but you can read in description)
variable "public_subnets" {
  description = "List of public subnets"
  default     = ["10.10.100.0/24", "10.10.101.0/24"]
}

# range of IP addresses we will use for private subnets (won't go into CIDR block ranges but you can read in description)
variable "private_subnets" {
  description = "List of private subnets"
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
}

# Physical zones AWS will put our resources in
variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}