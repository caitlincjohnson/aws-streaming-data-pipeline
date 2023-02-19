terraform {
  backend "s3" {
    bucket = "24suphyy1k-terraform-state-bucket"
    key    = "tfstate"
    region = "us-west-2"
  }
}