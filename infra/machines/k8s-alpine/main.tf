terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
  backend "pg" {
    conn_str = "postgres://postgres/terraform_backend?sslmode=disable"
  }
}
provider "proxmox" {
  pm_api_url          = var.proxmox_settings.api
  pm_api_token_id     = var.proxmox_token
  pm_api_token_secret = var.proxmox_secret
  pm_tls_insecure     = var.proxmox_settings.insecure
}

resource "proxmox_vm_qemu" "k8s" {
  for_each = var.virtual_machines

  name        = each.key
  target_node = var.proxmox_settings.host
  clone       = each.value.template
  vmid        = each.value.vmid
  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cores
  sockets     = each.value.sockets
  cpu         = "host"
  ciuser      = var.user
  cipassword  = var.password
  memory      = each.value.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  disk {
    slot    = 0
    size    = each.value.disk_size
    type    = "scsi"
    storage = each.value.storage
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=${each.value.ip}/24,gw=${var.network_gateway}"
  sshkeys   = var.ssh_key
  tags      = "k8"
}