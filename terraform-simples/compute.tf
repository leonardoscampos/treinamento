resource "google_service_account" "default" {
  account_id   = "treinamento-sa"
  display_name = "treinamento-sa"
}

resource "google_compute_instance" "main" {
  name             = "treinamento-computer"
  machine_type     = "e2-medium"
  zone             = "us-central1-a"
  desired_status   = "RUNNING"
  boot_disk {
    initialize_params {
      size  = 50
      image = "debian-cloud/debian-9"
      type  = "pd-standard"
    }
  }
  guest_accelerator {
    type  = ""
    count = 0
  }

  network_interface {
    network = "treinamento-network"
    subnetwork         = "treinamento-subnetwork"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    block-project-ssh-keys = true
  }
 
  service_account {
    email = google_service_account.default.email
    scopes = [
      "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }
  lifecycle {
    ignore_changes = []
  }
}
