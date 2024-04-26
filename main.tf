
resource "google_compute_network" "auto-vpc-tf" {
 project                  = "gcp-tutorial-project-1-417922" 
  name                    = "auto-vpc-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tf" {
  project                 = "gcp-tutorial-project-1-417922"
  name                    = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-la" {
  name                     =      "sub-la"
  ip_cidr_range            = "10.1.0.0/24"
  region                   = "us-west2"
  private_ip_google_access = true 
  network       = google_compute_network.custom-vpc-tf.id
}

resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges =  ["73.239.53.23/32"]
}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}

