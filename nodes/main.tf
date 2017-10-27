variable "digitalocean_token" {}

variable "rancher_version_tag" {
  default = "stable"
}

variable "ssh_keys" {
  type = "list"
}

data "terraform_remote_state" "rancher-stack" {
  backend = "local"

  config {
    path = "${path.module}/../rancher-stack/terraform.tfstate"
  }
}


module "digital-ocean" {
  source = "../modules/digital-ocean"
  node_count = 2
  digitalocean_token = "${var.digitalocean_token}"
  docker_cmd = "${data.terraform_remote_state.rancher-stack.registration-token}"
  ssh_keys = "${var.ssh_keys}"
  instance_type = "node"
}
