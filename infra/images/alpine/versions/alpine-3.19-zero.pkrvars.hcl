# Uncomment if the ISO already exists in the 'iso_storage_pool' location
#iso_file = "alpine-virt-3.19.1-x86_64.iso"
iso_url      = "https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.1-x86_64.iso"
iso_checksum = "366317d854d77fc5db3b2fd774f5e1e5db0a7ac210614fd39ddb555b09dbb344"
template_target = "alpine-3.19-docker"
template_description   = "Alpine Zero Template"
template_vm_id  = 9001
initial_packages = [
    "apk update",
    "apk add sudo",
    "apk add --no-cache cloud-init cloud-utils-growpart e2fsprogs-extra",
    "apk add --no-cache docker docker-compose openrc",
    "rc-update add docker default"
]