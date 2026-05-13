terraform {
  required_version = ">= 1.0"
  
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"  # Рабочая версия
    }
  }
}
