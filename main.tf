provider "aws" {
    region = "ap-south-1"
    version = "~> 3.6.0"
}

module "website_s3_bucket" {
    source = "./modules/aws-s3-static-website-bucket"

    bucket_name = "zebra-1234"

    tags = {
        Terraform = "true"
        Environment = "dev"
    }
}
