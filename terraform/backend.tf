terraform {
  backend "s3" {
    bucket = "fem-fd-service-altff4"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}