terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = var.pm_api_url

  username = var.pm_user
  password = var.pm_password

  insecure = true
}

resource "proxmox_virtual_environment_vm" "vm1" {

  name      = "cloud-vm-test"
  node_name = "pve"

  clone {
    vm_id = 9000
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "devops"
      password = "P@ssw0rd99!"
    }
  }

}

output "vm_ip" {
  value = proxmox_virtual_environment_vm.vm1.ipv4_addresses
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    vm_ip = proxmox_virtual_environment_vm.vm1.ipv4_addresses[1][0]
  })

  filename = "${path.module}/../../ansible/inventory/hosts.ini"
}
