output "vm_external_ip" {
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
  description = "Публичный IP ВМ"
}

output "kittygram_url" {
  value       = "http://${yandex_compute_instance.vm.network_interface[0].nat_ip_address}:${var.gateway_port}"
  description = "URL Kittygram"
}

output "app_bucket_name" {
  value       = yandex_storage_bucket.app_bucket.bucket
  description = "Имя S3 бакета приложения"
}
