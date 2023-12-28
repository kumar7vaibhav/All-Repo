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
