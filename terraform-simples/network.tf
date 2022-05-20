resource "google_compute_subnetwork" "treinamento-subnetwork" {
  name          = "treinamento-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.treinamento-network.id
  secondary_ip_range {
    range_name    = "treinamento-range"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_network" "treinamento-network" {
  name                    = "treinamento-network"
  auto_create_subnetworks = false
}
