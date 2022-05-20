locals {
  sa_name  = "treinamento-sa"
}

resource "google_service_account" "default" {
  account_id   = local.sa_name
  display_name = local.sa_name
}

resource "google_compute_instance" "main" {
  for_each         = var.specification
  name             = join("-", ["gce", each.key])
  machine_type     = var.specification[each.key].instance_type
  zone             = join("-", [var.region, "a"])
  desired_status   = var.status[each.key]
  boot_disk {
    initialize_params {
      size  = var.specification[each.key].volume_size
      image = var.specification[each.key].image
      type  = var.specification[each.key].volume_type
    }
  }
  guest_accelerator {
    type  = var.specification[each.key].gpu_type
    count = var.specification[each.key].gpu_count
  }

  network_interface {
    network         = var.network_name
    subnetwork = var.subnet_name

    access_config {
      // Ephemeral public IP
    }
  }
 
  metadata = {
    block-project-ssh-keys                    = true
  }

  service_account {
    email  = google_service_account.default.email
    scopes = var.service_account_scopes
  }
  lifecycle {
    ignore_changes = []
  }
}
