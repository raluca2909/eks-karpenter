terraform {
  backend "s3" {
    bucket = "XXXXXXXXX-bucket-state-file-karpenter"
    region = "eu-central-1"
    key    = "karpenter.tfstate"
  }
}