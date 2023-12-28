
variable "account_id" {
 description = "The ID of the Google service account"
 default    = "test-gcf-sa"
}

variable "display_name" {
 description = "The display name of the Google service account"
 default    = "Test Service Account"
}

variable "project" {
 description = "The Google Cloud project ID"
 default    = "terraform-pubsub-409511"
}

variable "topic_name" {
 description = "The name of the PubSub topic"
 default    = "functions2-topic"
}

variable "bucket_name" {
 description = "The name of the storage bucket"
 default    = "2165421516-gcf-source"
}

variable "location" {
 description = "The location of the resources"
 default    = "asia-south2"
}

variable "uniform_bucket_level_access" {
 description = "Whether to enable uniform bucket level access"
 default    = true
}

variable "output_path" {
 description = "The path to store the function source code"
 default    = "/tmp/function-source.zip"
}

variable "type" {
 description = "The type of the function source code"
 default    = "zip"
}

variable "source_dir" {
 description = "The directory containing the function source code"
 default    = "./helloPubSub"
}

variable "bucket_object_name" {
 description = "The name of the object in the storage bucket"
 default    = "function-source.zip"
}

variable "function_name" {
 description = "The name of the Cloud Function"
 default    = "function"
}

variable "function_location" {
 description = "The location of the Cloud Function"
 default    = "asia-south2"
}

variable "runtime" {
 description = "The runtime of the Cloud Function"
 default    = "nodejs16"
}

variable "entry_point" {
 description = "The entry point of the Cloud Function"
 default    = "helloPubSub"
}

variable "max_instance_count" {
 description = "The maximum number of instances for the Cloud Function"
 default    = 3
}

variable "min_instance_count" {
 description = "The minimum number of instances for the Cloud Function"
 default    = 1
}

variable "available_memory" {
 description = "The amount of memory available for the Cloud Function"
 default    = "256M"
}

variable "timeout_seconds" {
 description = "The timeout for the Cloud Function"
 default    = 60
}

variable "ingress_settings" {
 description = "The ingress settings for the Cloud Function"
 default    = "ALLOW_INTERNAL_ONLY"
}

variable "all_traffic_on_latest_revision" {
 description = "Whether to route all traffic to the latest revision"
 default    = true
}

variable "trigger_region" {
 description = "The region of the trigger"
 default    = "asia-south2"
}

variable "event_type" {
 description = "The type of the event trigger"
 default    = "google.cloud.pubsub.topic.v1.messagePublished"
}

variable "retry_policy" {
 description = "The retry policy for the event trigger"
 default    = "RETRY_POLICY_RETRY"
}