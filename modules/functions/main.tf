resource "google_storage_bucket" "bucket" {
  name     = var.gcp_storage_name
  location = var.gcp_storage_location
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./modules/functions/show_hi.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "python-test-function-jerry"
  description = "This is my first test function"
  runtime     = "python39"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "show_hi"
  environment_variables = {
  }
}

# IAM entry for all users to invoke the function
# resource "google_cloudfunctions_function_iam_member" "invoker" {
#   project        = google_cloudfunctions_function.function.project
#   region         = google_cloudfunctions_function.function.region
#   cloud_function = google_cloudfunctions_function.function.name

#   role   = "roles/cloudfunctions.invoker"
#   member = "allUsers"
# }
