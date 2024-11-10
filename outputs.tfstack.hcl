output "lambda_urls" {
  type = list(string)
  description = "URLs to invoke lambda functions"
  value = [ for x in component.s3: x.bucket_id ]
}
