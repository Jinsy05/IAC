provider "aws" {
    assume_role {
        role_arn = "arn:aws:iam::820912175766:user/iac_deployment_user"
        profile = "default"
    }
    region = var.region
  }
}
