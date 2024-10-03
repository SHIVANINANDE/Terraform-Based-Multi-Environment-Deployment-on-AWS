resource "aws_s3_bucket" "my-bucket" {
   bucket = "${var.my-env}-shivaninande-bucket"
   tags = {
     Name="${var.my-env}-shivaninande-bucket"
     environment=var.my-env
   }
}

