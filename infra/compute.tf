data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts"
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  hostname    = var.vm_name
  zone        = var.zone
  platform_id = "standard-v2"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 5 
  }

  boot_disk {
    initialize_params {
      type     = var.disk_type
      size     = 20
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet.id
    nat                = var.nat
    security_group_ids = [yandex_vpc_security_group.sg.id]
  }

  metadata = {
    "ssh-keys"  = "user:${var.ssh_key}"
    "user-data" = templatefile("${path.module}/cloudinit.yml", {
    SSH_KEY = var.ssh_key
    })
  }
}
