terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "resume_website" {
  bucket = "tosin-resume"
}

resource "aws_s3_bucket_website_configuration" "resume_website" {
  bucket = aws_s3_bucket.resume_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}
