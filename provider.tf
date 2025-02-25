terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project      = "gcp-tutorial-project-1-417922"
  region       = "us-west2"
  zone         = "us-west2-a"
  credentials  = "############.json"
  }
