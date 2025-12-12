terraform {
    required_providers {
        yandex = {
            source = "yandex-cloud/yandex"
        }
    }
    required_version = ">= 0.47.0"
}

provider "yandex" {
    token     = var.yc_token
    cloud_id  = var.yc_cloud_id
    folder_id = var.yc_folder_id
    zone      = var.vm_zone
}

resource "yandex_vpc_network" "main" {
    name = var.network_name
}

resource "yandex_vpc_subnet" "subnet-a" {
    name            = var.subnet_name
    zone            = var.vm_zone
    network_id      = yandex_vpc_network.main.id
    v4_cidr_blocks  = var.subnet_cidr
}

resource "yandex_vpc_security_group" "web-sg" {
  name       = var.sg_name
  network_id = yandex_vpc_network.main.id

  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = var.sg_allowed_ssh_cidrs
  }

  ingress {
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = var.sg_allowed_http_cidrs
  }
}

resource "yandex_compute_instance" "web" {
  name        = var.vm_name
  zone        = var.vm_zone
  platform_id = var.vm_platform_id
  
  resources {
    cores  = var.vm_resources_cores
    memory = var.vm_resources_memory
  }
  
  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = var.vm_disk_size
    }
  }
  
  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet-a.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.web-sg.id]
  }
  
  metadata = {
    ssh-keys = var.ssh_public_key_path
  }
}
