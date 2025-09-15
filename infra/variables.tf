variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc_name" {
  type    = string
  default = "infra-network"
}

variable "subnet_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "vm_name" {
  type    = string
  default = "vm-for-kittygram"
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2
}

variable "disk_type" {
  type    = string
  default = "network-hdd"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "nat" {
  type    = bool
  default = true
}

variable "ssh_key" {
  type = string
}

variable "gateway_port" {
  type    = number
  default = 9000
}

variable "bucket_prefix" {
  type    = string
  default = "kittygram-app"
}
