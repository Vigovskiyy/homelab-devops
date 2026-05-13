terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "local" {}
provider "random" {}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "local_file" "server_info" {
  filename = "${var.project_name}-server-info.txt"

  content = <<EOT
Project: ${var.project_name}
Environment: ${var.environment}
Owner: ${var.owner}
Generated ID: ${random_string.suffix.result}
EOT
}
