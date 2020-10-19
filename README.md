1. Change the bucket_name argument in root module inside module block
2. Run terraform apply
3. Place the static files inside www folder
4. Run, aws s3 cp www/ s3://$(terraform output website_bucket_name)/ --recursive
5. access url: terraform output website_endpoint
