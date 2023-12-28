variable "topic_name" {
  description = "Name of the Topic"
  type = string
}

variable "project" {
  description = "Project ID"
}

resource "google_pubsub_topic" "default" {
  name = var.topic_name 
  project = var.project
}