provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable the APIs required to run a Cloud Run service.
resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

# Deploy the demo container image to Cloud Run (v2 API).
resource "google_cloud_run_v2_service" "demo" {
  name     = var.service_name
  location = var.region

  template {
    containers {
      image = var.image

      ports {
        container_port = 8080
      }

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 2
    }
  }

  depends_on = [google_project_service.run]
}

# Optionally allow public (unauthenticated) access to the service.
resource "google_cloud_run_v2_service_iam_member" "public" {
  count = var.allow_unauthenticated ? 1 : 0

  project  = google_cloud_run_v2_service.demo.project
  location = google_cloud_run_v2_service.demo.location
  name     = google_cloud_run_v2_service.demo.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}
