proxmox_settings = {
  host     = "s01"
  api      = "https://s01.kng.rocks:8006/api2/json"
  insecure = true
}
network_gateway = "10.0.1.1"

virtual_machines = {
  "k8s-master"   = { vmid = 801, ip = "10.0.1.31", sockets = 1, cores = 2, memory = 8192, disk_size = "64G", storage = "local-lvm", template = "ubuntu-20.4-k8s" },
  "k8s-worker-1" = { vmid = 802, ip = "10.0.1.32", sockets = 1, cores = 2, memory = 4096, disk_size = "64G", storage = "local-lvm", template = "ubuntu-20.4-k8s" },
  "k8s-worker-2" = { vmid = 803, ip = "10.0.1.33", sockets = 1, cores = 2, memory = 4096, disk_size = "64G", storage = "local-lvm", template = "ubuntu-20.4-k8s" },
  "k8s-worker-3" = { vmid = 804, ip = "10.0.1.34", sockets = 1, cores = 2, memory = 4096, disk_size = "64G", storage = "local-lvm", template = "ubuntu-20.4-k8s" },
  "k8s-worker-4" = { vmid = 805, ip = "10.0.1.35", sockets = 1, cores = 2, memory = 4096, disk_size = "64G", storage = "local-lvm", template = "ubuntu-20.4-k8s" },
}
ssh_key  = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE4SrYkfM8Xu/9cFpqIOb8Y4OJ3WyPYJRB1zMOoTPJQN george@Georgioss-MacBook-Pro.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwde9+x+Lg0QT2eSDmoRaJCYpjJGGKGPRvS8rPttosYn3mIvcXf12+hzd0tLw6giQOQxQI0k5+2bmGI4T8bD1vwGfZ59oLuXBddvc9zAdf61SB7rntG8yFiZ/CKpmkAMhLrItcJztUu5gioOYY41c6Vo7hKoaropgvkeAjFcFD5zwwTH0U2jfecOLXD0o4IsRGbGph+SapL7bYZR65kkQMzj2Q7ZkGjOFiqEhK3Mg/ocv/5k7up2efPy47XC210Ejc5Mp2sXcSSUsLClVcrnm+N+zut9i25rM5eHyIPddP+iWmlOLDQ9RPiHipDIAWxS5jjmv5jlyr8y9UAuPfXYLqlR9l6TnU1uPjVwyPtWiqXpnra1DJVkfdPb2mIlxwVMzjrnLADPFW4jZ6hxkWehMo8xdtcCeGTXamwaoO6/5DP7hagW21yETKinle95rjpq5eCmQ+HaAnE/uLTsMJsZi/K3iwrq8Foe+DDGXnG56FQFhfUK/fMEVBvxts12wNn0xVLREaFFkRDSGinHl6oFDp86u8OGfChHbct4jr8xHr2V/bVYoyqp564EZmalslR5ywm4wEeUNWwsJIFvzv+1SkcJtvz/3cyiCT9kJlKCKtDfTSo+KiQhWI+wt3I6YMJdbJu06uQ+ERUj7ELGrAWZhEjHpq6kUZvcTQqtlV+vx8+w== gitops
EOF
user     = "kube"
password = "kube"