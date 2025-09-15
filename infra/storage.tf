resource "random_string" "suffix" {
  length = 6
  lower  = true
  numeric = true
}

resource "yandex_storage_bucket" "app_bucket" {
  bucket = "${var.bucket_prefix}-${var.folder_id}"
}
