variable "bucket_name" {
  description = "Name of the storage bucket. Needs to be globally unique"
  type = string
}

variable "location" {
  description = "Location for the resource"
  type = string
}

variable "uniform_bucket_level_access" {
  type = bool
}