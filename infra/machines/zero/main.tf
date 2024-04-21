terraform {
  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.15"
    }
  }
}
provider "proxmox" {
  pm_api_url          = var.proxmox_url
  pm_api_token_id     = var.proxmox_token
  pm_api_token_secret = var.proxmox_secret
  pm_tls_insecure     = var.proxmox_insecure
}
resource "proxmox_vm_qemu" "vms" {
  for_each = var.virtual_machines
  name        = each.key
  target_node = var.target_node
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
  tags      = var.tags
}