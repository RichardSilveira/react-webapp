locals {
  bucket_name = "${var.domain_name}-${random_uuid.new.result}"
}

resource "random_uuid" "new" {

}

resource "aws_s3_bucket" "website" {
  bucket = local.bucket_name
  acl    = "public-read"
  policy = templatefile("${path.module}/policies/website.tftpl", {
    BUCKET_NAME = local.bucket_name
  })

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = merge(var.common_aws_tags, {
    Name = "${var.domain_name} S3 Bucket"
  })
}