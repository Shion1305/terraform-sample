variable "project_id" {
  description = "The Google Cloud project ID to deploy resources into."
  type        = string
  default     = "cloudrunsample"
}

variable "region" {
  description = "The Google Cloud region for the Cloud Run service."
  type        = string
  default     = "asia-northeast1"
}

variable "service_name" {
  description = "Name of the Cloud Run service."
  type        = string
  default     = "demo-app"
}

variable "image" {
  description = "Container image to deploy. Defaults to Google's Cloud Run demo image."
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "allow_unauthenticated" {
  description = "Whether to allow public (unauthenticated) access to the service."
  type        = bool
  default     = true
}
