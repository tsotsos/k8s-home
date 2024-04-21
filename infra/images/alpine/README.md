# Alpine 3 AMD64 Packer Template
Uses virtual cd-rom to help automate the image creation.
## Available versions

| Alpine Version | Var File                    | Mission   | Outstanding Packages |
| -------        | --------                    | --------  | -------------------- |
| 3.18.2         | alpine-3.18.pkvars.hcl      | Generic   | None                 |
| 3.18.2         | alpine-3.18-k8s.pkrvars.hcl | Kubernetes| Docker, Containerd, Kubeadm,kubeclt,flannel |
| 3.18.2         | alpine-3.18-zero.pkrvars.hcl| Docker    | Docker, docker-compose |

## Validate
```bash
packer validate --var-file=versions/alpine-3.18.pkrvars.hcl .
```

## Run examples

```bash
packer build -var-file=versions/alpine-3.18.pkrvars.hcl .
```

## 