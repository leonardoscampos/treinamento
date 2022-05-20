resource "google_compute_network" "treinamento-network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "treinamento-subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.treinamento-network.id
  secondary_ip_range {
    range_name    = "treinamento-range"
    ip_cidr_range = "192.168.10.0/24"
  }
}
