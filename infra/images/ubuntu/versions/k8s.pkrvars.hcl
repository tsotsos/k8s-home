# Uncomment if the ISO already exists in the 'iso_storage_pool' location
iso_storage_pool = "local"
iso_file = "ubuntu-22.04.4-live-server-amd64.iso"
iso_url      = "https://releases.ubuntu.com/22.04.4/ubuntu-22.04.4-live-server-amd64.iso"
iso_checksum = "45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"
template_target = "ubuntu-20.4-k8s"
template_description   = "Ubuntu 20.4 K8s"
template_vm_id  = 9021
timezone    = "Europe/Athens"
playbook_file  = "./k8s.yml"