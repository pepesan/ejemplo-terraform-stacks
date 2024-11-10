# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "development" {
  inputs = {
    regions        = ["eu-west-3", "eu-west-2"]
    default_tags   = {
      environment = "dev"
      stacks-preview-example = "component-expansion-stack"
    }
  }
}

deployment "production" {
  inputs = {
    regions        = ["eu-west-3"]
    default_tags   = {
      environment = "prod"
      stacks-preview-example = "component-expansion-stack"
    }
  }
}
