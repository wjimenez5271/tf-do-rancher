data "terraform_remote_state" "server" {
  backend = "local"

  config {
    path = "${path.module}/../server/terraform.tfstate"
  }
}

provider "rancher" {
  api_url = "http://${data.terraform_remote_state.server.server-ip}:8080"
}

resource "rancher_environment" "default" {
  name = "Default"
  description = "The Default environment"
  orchestration = "cattle"
}

resource "rancher_registration_token" "default" {
  name = "default_token"
  description = "Registration token for the env1 environment"
  environment_id = "${rancher_environment.default.id}"
}

output "registration-token" {
  value = "${rancher_registration_token.default.command}"
}
