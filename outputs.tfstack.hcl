output "bucket_ids" {
  type = list(string)
  description = "bucket  ids"
  value = [ for x in component.s3: x.bucket_id ]
}
