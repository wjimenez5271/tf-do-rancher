variable "digitalocean_token" {}

variable "rancher_version_tag" {
  default = "stable"
}

variable "ssh_keys" {
  type = "list"
}

variable "node_count" {
  default = 2
}

data "terraform_remote_state" "rancher-stack" {
  backend = "local"

  config {
    path = "${path.module}/../rancher-stack/terraform.tfstate"
  }
}


module "digital-ocean" {
  source = "../modules/digital-ocean"
  node_count = "${var.node_count}"
  digitalocean_token = "${var.digitalocean_token}"
  docker_cmd = "${data.terraform_remote_state.rancher-stack.registration-token}"
  ssh_keys = "${var.ssh_keys}"
  instance_type = "node"
}
