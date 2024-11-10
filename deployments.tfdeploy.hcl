# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
identity_token "aws" {
  audience = ["aws.workload.identity"]
}


deployment "development" {
  inputs = {
    regions        = ["eu-west-3", "eu-west-2"]
    identity_token = identity_token.aws.jwt
    default_tags   = {
      environment = "dev"
      stacks-preview-example = "component-expansion-stack"
    }
  }
}

deployment "production" {
  inputs = {
    regions        = ["eu-west-3"]
    identity_token = identity_token.aws.jwt
    default_tags   = {
      environment = "prod"
      stacks-preview-example = "component-expansion-stack"
    }
  }
}
