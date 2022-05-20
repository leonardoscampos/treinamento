locals {
  sa_name  = "treinamento-sa"
}

resource "google_service_account" "default" {
  account_id   = local.sa_name
  display_name = local.sa_name
}

resource "google_compute_instance" "main" {
  name             = var.compute_name
  machine_type     = var.compute_type
  zone             = join("-", [var.region, "a"])
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
    network = var.network_name
    subnetwork = var.subnet_name

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
