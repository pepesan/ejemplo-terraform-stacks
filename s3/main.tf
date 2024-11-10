# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "random_pet" "bucket_name" {
  prefix = "hello-world-stacks-"
  length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = random_pet.bucket_name.id
}

resource "aws_s3_bucket_ownership_controls" "bucket_controls" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_controls]

  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

