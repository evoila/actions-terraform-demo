terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = "3.3.0"
    }
  }
  backend "s3" {
    bucket = "tf-state" # Name of the S3 bucket
    endpoints = {
      s3 = "https://mys3endpoint" # Minio endpoint
    }
    key = "actions-terraform.tfstate" # Name of the tfstate file

    #config needed for s3 minio to work
    region                      = "main" # Region validation will be skipped
    skip_credentials_validation = true   # Skip AWS related checks and validations
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = true # Enable path-style S3 URLs (https://<HOST>/<BUCKET> https://developer.hashicorp.com/terraform/language/settings/backends/s3#use_path_style
    insecure                    = true
    skip_s3_checksum            = true
  }
}

provider "nsxt" {
  allow_unverified_ssl = true
  max_retries          = 5
}