output "website_bucket_arn" {
    value = module.website_s3_bucket.arn
}

output "website_bucket_name" {
    value = module.website_s3_bucket.name
}

output "website_endpoint" {
    value = "http://${module.website_s3_bucket.website_endpoint}"
}

