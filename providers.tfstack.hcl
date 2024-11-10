# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.7.0"
  }

  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }
}

provider "aws" "configurations" {
  for_each = var.regions

  config {
    region = each.value

    default_tags {
      tags = var.default_tags
    }
  }
}

provider "random" "this" {}
