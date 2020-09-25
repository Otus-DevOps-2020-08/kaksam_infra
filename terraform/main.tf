provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  count = var.instances_count
  name  = "reddit-app-${count.index}"
  zone  = var.VM_zone

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  scheduling_policy {
    preemptible = true
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      # id образа созданного в предыдущем домашем задании
      image_id = var.image_id

    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
}
