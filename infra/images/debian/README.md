# Ubuntu 22.04 AMD64 Packer Template

## Available versions

| Ubuntu Version | Var File                    | Mission   | Outstanding Packages |
| -------        | --------                    | --------  | -------------------- |
| 22.04          | ubuntu-3.18.pkvars.hcl      | Generic   | None                 |

## Validate
```bash
packer validate --var-file=versions/ubuntu-20.04.pkrvars.hcl .
```

## Run examples

```bash
packer build -var-file=versions/ubuntu-20.04.pkrvars.hcl .
```

## 