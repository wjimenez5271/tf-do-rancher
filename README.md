## Terraform Plans for deploying Rancher on Digital Ocean

This is a attempt to provide a 'single click' deployment of [http://rancher.com](Rancher) on [http://digitalocean.com](Digital Ocean's) IaaS. There is some modularity to it but the focus is on ease of use so we make some assumptions about the way it should work. It currently needs to create a new environment (called `DigitalOcean`) to add the DO Droplets to rather than using the `Default` environment that Rancher creates automatically.

#### Requirements

- [https://www.terraform.io/](Terraform) (version 0.10 or higher)
- Human (to push the button)

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
- `orchestration` (optional)

Find the IP of the droplet/node named `rancher-server-0` and go to `http://<ipv4_address>:8080` to get to the Rancher UI. The rancher-nodes will be in the environment called `DigitalOcean`
