# create VM with special image APP and our VPC
resource "yandex_compute_instance" "app" {
  name = "reddit-app-${var.name}"

  labels = {
    tags = "reddit-app"
  }
  scheduling_policy {
    preemptible = true
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
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
//  provisioner "file" {
//    content = templatefile("${path.module}/files/puma.service",
//    { database_url = var.db_ip_addr, })
//    destination = "/tmp/puma.service"
//  }
//
//  provisioner "remote-exec" {
//    inline = [
//      "sudo mv /tmp/puma.service /etc/systemd/system/puma.service",
//      "sudo systemctl daemon-reload",
//      "sudo systemctl restart puma"
//    ]
//  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
