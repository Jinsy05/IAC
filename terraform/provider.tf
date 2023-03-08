provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::820912175766:role/S3"
    session_name = "S3"
  }
}
