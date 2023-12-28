output "bucket_name" {
  value = google_storage_bucket.default.name
  description = "The name of the bucket"
}

output "bucket_object_name" {
  value = google_storage_bucket_object.default.name
  description = "The name of the object created in the storage bucket"
}