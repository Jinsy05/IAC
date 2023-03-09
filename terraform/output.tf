
output "website_endpoint" {
  value = "${aws_s3_bucket.DevopsIacPipeline.website_endpoint}"
}
