# Uncomment if the ISO already exists in the 'iso_storage_pool' location
#iso_file = "alpine-virt-3.19.1-x86_64.iso"
iso_url      = "https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-virt-3.19.1-x86_64.iso"
iso_checksum = "366317d854d77fc5db3b2fd774f5e1e5db0a7ac210614fd39ddb555b09dbb344"
template_target = "alpine-3.19-k8s"
template_description   = "Alpine Kubernetes"
template_vm_id  = 9002
initial_packages = [
    "swapoff -a",
    "sed -i '/swap/d' /etc/fstab",
    "echo \"br_netfilter\" > /etc/modules-load.d/k8s.conf",
    "modprobe br_netfilter",
    "echo 1 > /proc/sys/net/ipv4/ip_forward",
    "printf \"http://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing\" >> /etc/apk/repositories",
    "apk update",
    "apk add --no-cache sudo",
    "apk add --no-cache 'python3=~3.12.3-r1'",
    "apk add --no-cache cloud-init cloud-utils-growpart e2fsprogs-extra",
    "apk add --no-cache docker docker-compose openrc",
    "apk add --no-cache cni-plugins cni-plugin-flannel flannel flannel-contrib-cni kubelet kubeadm kubectl containerd uuidgen nfs-utils",
    "rc-update add docker default",
    "swapoff -a",
    "mount --make-rshared /",
    "echo \"#!/bin/sh\" > /etc/local.d/sharemetrics.start",
    "echo \"mount --make-rshared /\" >> /etc/local.d/sharemetrics.start",
    "chmod +x /etc/local.d/sharemetrics.start",
    "rc-update add local",
    "uuidgen > /etc/machine-id",
    "rc-update add containerd",
    "rc-update add kubelet",
    "rc-update add ntpd",
    "/etc/init.d/ntpd start",
    "/etc/init.d/containerd start",
    "rm -rf /usr/libexec/cni/flannel",
    "ln -s /usr/libexec/cni/flannel-amd64 /usr/libexec/cni/flannel",
    "echo \"net.bridge.bridge-nf-call-iptables=1\" >> /etc/sysctl.conf",
    "sysctl net.bridge.bridge-nf-call-iptables=1",
    "apk add --no-cache 'kubelet=~1.29'",
    "apk add --no-cache 'kubeadm=~1.29'",
    "apk add --no-cache 'kubectl=~1.29'"
]