data "archive_file" "default" {
  type        = var.type
  output_path = var.output_path
  source_dir  = var.source_dir
}

resource "google_storage_bucket_object" "default" {
  name   = var.bucket_object_name
  bucket = var.bucket
  source = var.file_source
}