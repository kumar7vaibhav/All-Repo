output "pubsub_topic_id" {
  value = google_pubsub_topic.default.id
  description = "ID of the Topic"
}