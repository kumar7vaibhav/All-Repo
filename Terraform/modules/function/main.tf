resource "google_cloudfunctions2_function" "default" {
  name        = var.function_name
  location    = var.function_location
  project = var.project

  build_config {
    runtime     = var.runtime
    entry_point = var.entry_point
    environment_variables = {
      BUILD_CONFIG_TEST = "build_test"
    }
    source {
      storage_source {
        bucket = google_storage_bucket.default.name
        object = google_storage_bucket_object.default.name
      }
    }
  }

  service_config {
    max_instance_count = var.max_instance_count
    min_instance_count = var.min_instance_count
    available_memory   = var.available_memory
    timeout_seconds    = var.timeout_seconds
    environment_variables = {
      SERVICE_CONFIG_TEST = "config_test"
    }
    ingress_settings               = var.ingress_settings
    all_traffic_on_latest_revision = var.all_traffic_on_latest_revision
    service_account_email          = google_service_account.default.email
  }

  event_trigger {
    trigger_region = var.trigger_region
    event_type     = var.event_type
    pubsub_topic   = google_pubsub_topic.default.id
    retry_policy   = var.retry_policy
  }
}