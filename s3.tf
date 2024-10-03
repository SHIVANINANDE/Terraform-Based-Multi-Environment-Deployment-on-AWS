resource "aws_s3_bucket" "my-bucket" {
   bucket = "shivaninande-bucket"
   tags = {
     Name="shivaninande-bucket"
   }
}