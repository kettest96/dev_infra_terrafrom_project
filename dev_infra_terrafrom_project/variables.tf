variable "instance_name" {
    type = list(string)
    default = [ "Web_instance", "db-instance", "devops-instance" ]
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
}

# variable "aws_region" {
#   description = "The AWS region to create resources in"
#   type        = string
#   default     = "us-east-1"
# }

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "bucket_acl" {
  description = "The ACL policy for the S3 bucket"
  type        = string
  default     = "private"
}

variable "environment" {
  description = "The environment tag for the S3 bucket"
  type        = string
  default     = "dev"
}
