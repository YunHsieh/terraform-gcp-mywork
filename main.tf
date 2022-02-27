provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone.0
}

module "functions" {
  source = "./modules/functions"
}
