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

variable "output_path" {
  description = "out path for the file."
}

variable "type" {
  description = "type of file"
  default = "zip"
  type = string
}

variable "source_dir" {
  description = "path of the source file."
}

variable "bucket_object_name" {
  description = "Storage Bucket Object Name"
  type = string
}
