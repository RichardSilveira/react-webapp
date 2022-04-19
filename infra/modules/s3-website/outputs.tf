output "static_bucket_endpoint" {
  value = aws_s3_bucket.website.bucket_regional_domain_name
}