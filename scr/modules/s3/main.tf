resource "aws_s3_bucket" "demo-bucket" {
  bucket = "${var.demo_bucket}"
  tags = {
    Name        = "${var.bucket_name}"
    Environment = "${var.demo_env}"
  }
}