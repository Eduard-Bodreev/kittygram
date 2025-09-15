terraform {
  required_version = ">= 1.5.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.118"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  backend "s3" {
    endpoint                    = "https://storage.yandexcloud.net"
    bucket                      = "kittygram-tf"
    key                         = "terraform.tfstate"
    region                      = "ru-central1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    force_path_style            = true
  }
}

provider "yandex" {
  service_account_key_file = "authorized_key.json"
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}
