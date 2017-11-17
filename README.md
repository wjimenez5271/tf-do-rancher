## Terraform Plans for deploying Rancher on Digital Ocean

This is a attempt to provide a 'single click' deployment of [Rancher](http://rancher.com) on [Digital Ocean's](http://digitalocean.com) IaaS. There is some modularity to it but the focus is on ease of use so we make some assumptions about the way it should work. It currently needs to create a new environment (called `DigitalOcean`) to add the DO Droplets to rather than using the `Default` environment that Rancher creates automatically.

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

- `ssh_keys` - Digtial Ocean SSH Key ID to set for the droplet. One way to get this ID is to use [doctl](https://github.com/digitalocean/doctl) like so: `doctl compute ssh-key list | grep $keyname`
- `digitalocean_token` - [Digital Ocean Auth Token](https://www.terraform.io/docs/providers/do/index.html#token) for use by Terraform .
- `rancher_version_tag` (optional) - Version of rancher to use (e.g. `stable`, `latest`)
- `orchestration` (optional) - Orchestrator (e.g. `cattle`, `kubernetes`)

Additionally you can set the following Bash variables:

- `SLEEPTIME` - interval to sleep between polling attempts while waiting for the Rancher server (first node) to become ready. Script will initially wait 45 seconds before first polling attempt.

Find the IP of the droplet/node named `rancher-server-0` and go to `http://<ipv4_address>:8080` to get to the Rancher UI. The rancher-nodes will be in the environment called `DigitalOcean`
