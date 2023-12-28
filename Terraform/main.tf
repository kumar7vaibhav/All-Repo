terraform {
 required_providers {
   google = {
     source = "hashicorp/google"
     version = var.google_version
   }
 }
}

module "google_service_account" {
   source = "./modules/service_account"
   account_id = var.account_id
   display_name = var.display_name
   project   = var.project
}

module "google_pubsub_topic" {
   source = "./modules/pubsub"
   topic_name = var.topic_name
   project = var.project
}

module "google_storage_bucket" {
   source = "./modules/bucket"
   bucket_name = var.bucket_name
   location = var.location
   project = var.project
   uniform_bucket_level_access = var.uniform_bucket_level_access
   output_path = var.output_path
   type = var.type
   source_dir = var.source_dir
   bucket_object_name = var.bucket_object_name
}

module "google_cloudfunctions2_function" {
 source = "./modules/function"

 function_name = var.function_name
 function_location = var.function_location
 project = var.project
 runtime = var.runtime
 entry_point = var.entry_point
 bucket_name = module.google_storage_bucket.bucket_name
 bucket_object_name = module.google_storage_bucket.bucket_object_name

 max_instance_count = var.max_instance_count
 min_instance_count = var.min_instance_count
 available_memory = var.available_memory
 timeout_seconds = var.timeout_seconds
 ingress_settings = var.ingress_settings
 all_traffic_on_latest_revision = var.all_traffic_on_latest_revision
 service_account_email = module.google_service_account.service_account_email
 trigger_region = var.trigger_region
 event_type = var.event_type
 pubsub_topic_id = module.google_pubsub_topic.pubsub_topic_id
 retry_policy = var.retry_policy
}