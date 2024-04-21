##### Required Variables #####
variable "proxmox_token" {
  type    = string
  default = env("TF_VAR_proxmox_token")
}
variable "proxmox_secret" {
  type    = string
  default = env("TF_VAR_proxmox_secret")
}
variable "proxmox_node" {
  type    = string
  default = env("TF_VAR_proxmox_node")
}
variable "proxmox_url" {
  type    = string
  default = env("TF_VAR_proxmox_url")
}
variable "proxmox_skip_ssl" {
  type    = string
  default = true
}
variable "template_target" {
  type    = string
  default = "alpine-template"
}
variable "template_description" {
  type    = string
  default = "Base template for Alpine"
}
variable "template_vm_id" {
  type    = number
  default = 0
}
variable "initial_packages" {
  type    = list(string)
  default = [null]
}

variable "ssh_username" {
  type    = string
  default = "alpine"
}

variable "ssh_private_key_file" {
  type        = string
  description = "Path to private key file for SSH authentication."
  default     = null
}

variable "ssh_public_key" {
  type        = string
  description = "Public key data for SSH authentication. If set, password authentication will be disabled."
  default     = null
}

variable "ssh_agent_auth" {
  type        = bool
  description = "Whether to use an exisiting ssh-agent to pass in the SSH private key passphrase."
  default     = false
}

variable "root_password" {
  type        = string
  description = "root password to use during the setup process. A random password will be used if null."
  default     = null
  sensitive   = true
}

variable "disk_storage_pool" {
  type        = string
  description = "Storage pool for the boot disk and cloud-init image."
  default     = env("TF_VAR_proxmox_storage")

  validation {
    condition     = var.disk_storage_pool != null
    error_message = "The disk storage pool must not be null."
  }
}

variable "disk_size" {
  type        = string
  description = "The size of the OS disk, including a size suffix. The suffix must be 'K', 'M', or 'G'."
  default     = "64G"

  validation {
    condition     = can(regex("^\\d+[GMK]$", var.disk_size))
    error_message = "The disk size is not valid. It must be a number with a size suffix (K, M, G)."
  }
}

variable "disk_format" {
  type        = string
  description = "The format of the file backing the disk."
  default     = "raw"

  validation {
    condition     = contains(["raw", "cow", "qcow", "qed", "qcow2", "vmdk", "cloop"], var.disk_format)
    error_message = "The storage pool type must be either 'raw', 'cow', 'qcow', 'qed', 'qcow2', 'vmdk', or 'cloop'."
  }
}

variable "disk_type" {
  type        = string
  description = "The type of disk device to add."
  default     = "scsi"

  validation {
    condition     = contains(["ide", "sata", "scsi", "virtio"], var.disk_type)
    error_message = "The storage pool type must be either 'ide', 'sata', 'scsi', or 'virtio'."
  }
}

variable "memory" {
  type        = number
  description = "How much memory, in megabytes, to give the virtual machine."
  default     = 512
}

variable "cores" {
  type        = number
  description = "How many CPU cores to give the virtual machine."
  default     = 1
}

variable "sockets" {
  type        = number
  description = "How many CPU sockets to give the virtual machine."
  default     = 1
}

variable "iso_url" {
  type        = string
  description = "URL to an ISO file to upload to Proxmox, and then boot from."
  default     = "http://dl-cdn.alpinelinux.org/alpine/v3.15/releases/x86_64/alpine-virt-3.15.0-x86_64.iso"
}

variable "iso_storage_pool" {
  type        = string
  description = "Proxmox storage pool onto which to find or upload the ISO file."
  default     = "local"
}

variable "iso_file" {
  type        = string
  description = "Filename of the ISO file to boot from."
  default     = null # "alpine-virt-3.15.0-x86_64.iso"
}

variable "iso_checksum" {
  type        = string
  description = "Checksum of the ISO file."
  default     = null
}

variable "vm_interface" {
  type        = string
  description = "Name of the network interface that Packer gets the VMs IP from."
  default     = null
}

variable "network_bridge" {
  type        = string
  description = "The Proxmox network bridge to use for the network interface."
  default     = "vmbr0"
}

variable "cloud_init_storage_pool" {
  type        = string
  description = "Name of the Proxmox storage pool to store the Cloud-Init CDROM on. If not given, the storage pool of the boot device will be used (disk_storage_pool)."
  default     = null
}

variable "keyboard_layout" {
  type        = string
  description = "Sets the keyboard layout during the setup-alpine install."
  default     = "us"
}

variable "keyboard_variant" {
  type        = string
  description = "Sets the keyboard variant during the setup-alpine install."
  default     = "us"
}

variable "timezone" {
  type        = string
  description = "Sets the timezone during the setup-alpine install."
  default     = "Europe/Athens"
}

variable "dns_servers" {
  type        = list(string)
  description = "Sets the DNS servers during the setup-alpine install."
  default     = []

  validation {
    condition     = var.dns_servers != null
    error_message = "The DNS server list must not be null. An empty list is allowed."
  }
}
