resource "google_storage_bucket" "infra-bucket" {
  name     = "infra-bucket"
  location = "EU"
}

terraform {
  backend "gcs" {
    bucket  = "infra-bucket"
    path    = "terraform.tfstate"
    project = "infra-180108"
  }
}
