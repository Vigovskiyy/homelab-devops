terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

# Создаём случайную строку
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}

# Создаём локальный файл с информацией о сервере
resource "local_file" "server_info" {
  content = <<-EOT
    Server Information
    ==================
    Random ID: ${random_string.suffix.result}
    Timestamp: ${timestamp()}
    User: ${abspath(path.module)}
  EOT
  filename = "server_info.txt"
}

# Используем terraform_data для фиксации времени создания
resource "terraform_data" "creation_time" {
  input = timestamp()
}

# Обновим local_file, чтобы использовать зафиксированное время
resource "local_file" "server_info_fixed" {
  content = <<-EOT
    Server Information (Fixed)
    ==========================
    Random ID: ${random_string.suffix.result}
    Created: ${terraform_data.creation_time.input}
    User: ${abspath(path.module)}
  EOT
  filename = "server_info_fixed.txt"
}

# Ресурс, который не будет постоянно меняться
resource "local_file" "static" {
  content  = "Этот файл не меняется при каждом apply"
  filename = "static.txt"
}

variable "deployment_time" {
  default = "2026-04-16"
}

resource "local_file" "deployment_info" {
  content = <<-EOT
    Deployment Time: ${var.deployment_time}
    Environment: development
  EOT
  filename = "deployment.txt"
}
