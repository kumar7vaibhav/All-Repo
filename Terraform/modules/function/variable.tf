variable "function_name" {
  description = "Name of the function"
  type = string
}

variable "function_location" {
  description = "Location of the function"
  type = string
}

variable "project" {
  description = "project id"
  type = string
}

variable "runtime" {
  description = "Build Config Runtime Value"
  type = string
}

variable "entry_point" {
  description = "Set entry point"
  type = string
}

variable "bucket_name" {
  description = "Name of the storage bucket"
}

variable "bucket_object_name" {
  description = "Name of the object created in the storage bucket"
}

variable "max_instance_count" {
  description = "service config max instance count"
  type = number
}

variable "min_instance_count" {
  description = "service config min instance count"
  type = number
}

variable "available_memory" {
  description = "specify the memory"
  type = string
}

variable "timeout_seconds" {
  description = "value in seconds for timeout"
  type = number
}

variable "ingress_settings" {
  default = "ALLOW_INTERNAL_ONLY"
  type = string
}

variable "all_traffic_on_latest_revision" {
  default = true
  type = bool
}

variable "trigger_region" {
  description = "Region of the trigger"
  type = string
}

variable "event_type" {
  description = "Type of event"
  type = string
  default = "google.cloud.pubsub.topic.v1.messagePublished"
}

variable "pubsub_topic_id" {
  description = "ID of the pubsub topic"
}

variable "retry_policy" {
  description = "Retry policy"
  type = string
  default = "RETRY_POLICY_RETRY"
}