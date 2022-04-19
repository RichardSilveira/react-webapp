resource "aws_s3_bucket" "website" {
  bucket = var.domain_name
  acl    = "public-read"
  policy = templatefile("${path.module}/policies/website.tftpl", {
    BUCKET_NAME = var.domain_name
  })

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = merge(var.common_aws_tags, {
    Name = "${var.domain_name} S3 Bucket"
  })
}