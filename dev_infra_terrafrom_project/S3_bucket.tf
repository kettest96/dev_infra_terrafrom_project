

resource "aws_s3_bucket" "bckt1" {
  bucket = var.bucket_name
  
  

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bckt1.bucket
  key    = "myfile.txt"
  source = "C:/terraform/final/myfile.txt"
  
}
output "file_content1" {
  value = {
   content =  file("myfile.txt")
  length  = length(file("myfile.txt"))
  }
}

# output "bucket_output" {
#  value = ""
# }


# output "file_content" {
#   value = data.aws_s3_bucket_object.example.body
# }



# data "aws_s3_get_object" "example" {
#   bucket = var.bucket_name
#   key    = "C:/terraform/final/myfile.txt"
# }


# output "file_content" {
#   value = file_info.content
# }


