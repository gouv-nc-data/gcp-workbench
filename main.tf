locals {
  subnet = var.start_on_subnet ? var.subnet ? var.subnet : "projects/${var.project_id}/regions/${var.region}/subnetworks/subnet-for-vpn" : null
}

# API
# ----------------------------------------------
resource "google_project_service" "workbench_api_services" {
  for_each = toset([
    "notebooks.googleapis.com",
    # "composer.googleapis.com", # message d'erreur au lancement mais semble fonctionner quand meme sans activation.
    # "dataproc.googleapis.com"
  ])

  project = var.project_id
  service = each.value
}

# Service account
# ----------------------------------------------
resource "google_service_account" "workbench_sa" {
  project      = var.project_id
  account_id   = "workbench-sa"
  display_name = "Service Account for Workbench"
}

resource "google_project_iam_member" "workbench_sa_roles" {
  for_each = toset([
    "roles/aiplatform.user",
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ])

  role    = each.value
  member  = "serviceAccount:${google_service_account.workbench_sa.email}"
  project = var.project_id
}

# workbench instance
# ----------------------------------------------
resource "google_workbench_instance" "workbench_instance" {
  name          = "workbench-instance-on-vpc"
  location      = "${var.region}-b"
  project       = var.project_id
  desired_state = "STOPPED"

  gce_setup {
    machine_type = var.machine_type

    service_accounts {
      email = google_service_account.workbench_sa.email
    }

    network_interfaces {
      # subnet = values(module.spoke-vpc-mprh.vpc.subnets)[0].id
      subnet = local.subnet
    }
  }
}
