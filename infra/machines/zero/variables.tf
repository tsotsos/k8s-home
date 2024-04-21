variable "proxmox_token" {
  description = "Proxmox token for API, use secret or ENV"
  type        = string
}
variable "proxmox_secret" {
  description = "Proxmox secret for API, use secret or ENV"
  type        = string
}
variable "proxmox_url" {
  description = "Proxmox URL for API, use secret or ENV"
  type        = string
  
}
variable "proxmox_insecure" {
  description = "SSL verification"
  type = bool
  default = true
}
variable "target_node" {
  description = "Target Node"
  type = string  
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
variable "tags" {
  description = "List of Proxmox tags"
  type = string
}