## Terraform Plans for deploying Rancher on Digital Ocean

#### Usage

Deploy
```
make
```

Teardown
```
make teardown
```

Assumes you have the following terraform variables defined:

- `ssh_keys`
- `digitalocean_token`
- `rancher_version_tag` (optional)
