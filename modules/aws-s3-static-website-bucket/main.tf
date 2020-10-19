resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name
    acl = "public-read"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        }
    ]
    
}
EOF

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
    tags = var.tags

    force_destroy = true
}


resource "aws_s3_bucket_object" "webapp" {
    acl = "public-read"
    key = "index.html"
    bucket = aws_s3_bucket.s3_bucket.id
    content = file("${path.module}/www/index.html")
    content_type  = "text/html"
}

resource "aws_s3_bucket_object" "error_file" {
    acl = "public-read"
    key = "error.html"
    bucket = aws_s3_bucket.s3_bucket.id
    content = file("${path.module}/www/error.html")
    content_type = "text/html"
}