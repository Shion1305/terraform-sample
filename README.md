# Cloud Run Demo (Terraform)

Deploys Google's Cloud Run demo container image (`us-docker.pkg.dev/cloudrun/container/hello`)
to the `cloudrunsample` project using the Cloud Run v2 API.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.3
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) authenticated:
  ```sh
  gcloud auth application-default login
  ```
- A GCP project named `cloudrunsample` with billing enabled.

## Usage

```sh
terraform init
terraform plan
terraform apply
```

After apply completes, the service URL is printed as the `service_url` output.

## Configuration

Override defaults in `terraform.tfvars` or via `-var` flags:

- `project_id` – GCP project ID (default `cloudrunsample`)
- `region` – deployment region (default `asia-northeast1`, Tokyo)
- `service_name` – Cloud Run service name (default `demo-app`)
- `image` – container image (default Google's Cloud Run hello demo)
- `allow_unauthenticated` – allow public access (default `true`)

## Clean up

```sh
terraform destroy
```
