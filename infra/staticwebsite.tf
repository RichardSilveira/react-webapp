module "staticwebsite" {
  source          = "./modules/s3-website"
  domain_name     = var.domain_name
  common_aws_tags = local.common_aws_tags
}
