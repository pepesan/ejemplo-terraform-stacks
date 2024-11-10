# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "s3" {
  for_each = var.regions

  source = "./s3"

  inputs = {
    region = each.value
  }

  providers = {
    aws    = provider.aws.configurations[each.value]
    random = provider.random.this
  }
}