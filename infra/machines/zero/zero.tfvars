target_node = "s01"
network_gateway = "10.0.1.1"
virtual_machines = {
  "zero"   = { vmid = 100, ip = "10.0.1.20", sockets = 1, cores = 2, memory = 2048, disk_size = "64G", storage = "pmoxPool", template = "alpine-3.18-docker" },
}
ssh_key  = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE4SrYkfM8Xu/9cFpqIOb8Y4OJ3WyPYJRB1zMOoTPJQN george@Georgioss-MacBook-Pro.local
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwde9+x+Lg0QT2eSDmoRaJCYpjJGGKGPRvS8rPttosYn3mIvcXf12+hzd0tLw6giQOQxQI0k5+2bmGI4T8bD1vwGfZ59oLuXBddvc9zAdf61SB7rntG8yFiZ/CKpmkAMhLrItcJztUu5gioOYY41c6Vo7hKoaropgvkeAjFcFD5zwwTH0U2jfecOLXD0o4IsRGbGph+SapL7bYZR65kkQMzj2Q7ZkGjOFiqEhK3Mg/ocv/5k7up2efPy47XC210Ejc5Mp2sXcSSUsLClVcrnm+N+zut9i25rM5eHyIPddP+iWmlOLDQ9RPiHipDIAWxS5jjmv5jlyr8y9UAuPfXYLqlR9l6TnU1uPjVwyPtWiqXpnra1DJVkfdPb2mIlxwVMzjrnLADPFW4jZ6hxkWehMo8xdtcCeGTXamwaoO6/5DP7hagW21yETKinle95rjpq5eCmQ+HaAnE/uLTsMJsZi/K3iwrq8Foe+DDGXnG56FQFhfUK/fMEVBvxts12wNn0xVLREaFFkRDSGinHl6oFDp86u8OGfChHbct4jr8xHr2V/bVYoyqp564EZmalslR5ywm4wEeUNWwsJIFvzv+1SkcJtvz/3cyiCT9kJlKCKtDfTSo+KiQhWI+wt3I6YMJdbJu06uQ+ERUj7ELGrAWZhEjHpq6kUZvcTQqtlV+vx8+w== gitops
EOF
user     = "zero"
password = "zero"
tags = "HA, Critical, Management"