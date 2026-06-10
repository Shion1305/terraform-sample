output "service_url" {
  description = "The public URL of the deployed Cloud Run service."
  value       = google_cloud_run_v2_service.demo.uri
}

output "service_name" {
  description = "The name of the deployed Cloud Run service."
  value       = google_cloud_run_v2_service.demo.name
}
