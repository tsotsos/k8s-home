variable "proxmox_token" {
  description = "Proxmox token for API, use secret or ENV"
  type        = string
}
variable "proxmox_secret" {
  description = "Proxmox secret for API, use secret or ENV"
  type        = string
}
variable "proxmox_settings" {
  description = "Proxmox settings"
  type = object({
    host     = string
    api      = string
    insecure = bool
  })
  default = {
    host     = null
    api      = null
    insecure = true
  }
}
variable "network_gateway" {
  type    = string
  default = null
}
variable "virtual_machines" {
  type    = map(any)
  default = {}
}
variable "ssh_key" {
  type    = string
  default = null
}

variable "user" {
  type    = string
  default = null
}
variable "password" {
  type    = string
  default = null
}

