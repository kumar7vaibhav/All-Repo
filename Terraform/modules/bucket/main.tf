resource "google_storage_bucket" "default" {
  name                        = var.bucket_name
  location                    = var.location
  uniform_bucket_level_access = var.uniform_bucket_level_access
}

data "archive_file" "default" {
  type        = var.type
  output_path = var.output_path
  source_dir  = var.source_dir
}

resource "google_storage_bucket_object" "default" {
  name   = var.bucket_object_name
  bucket = google_storage_bucket.default.name
  source = data.archive_file.default.output_path
}