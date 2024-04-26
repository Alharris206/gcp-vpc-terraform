
resource "google_storage_bucket" "gcp-udemy-bucket-terraform" {
 name          = "gcp-udemy-bucket-terraform"
 storage_class = "nearline"
 location      = "us-west2"

 labels = {
    "env" = "tf_env"
    "dep" = "compliance"
 }

uniform_bucket_level_access = true

lifecycle_rule {
  condition {
    age = 5
    
  }
  action {
    type = "SetStorageClass"
    storage_class = "Coldline"
    
  }
 }

 retention_policy {
    is_locked = true
    retention_period = 864000
 }


}


resource "google_storage_bucket_object" "picture" {
    bucket = google_storage_bucket.gcp-udemy-bucket-terraform.name
    name   = "class_5_index"
    source = "index (1).html"
}

