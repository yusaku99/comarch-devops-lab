terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.4" 
    }
  }
}

variable "environment" {
  default = "production"
}

resource "local_file" "service_config" {
  filename = "${path.module}/../app/service.conf"
  content = <<-EOT
    SERVICE_NAME=comarch-loyalty-portal
    ENVIRONMENT=${var.environment}
    HIGH_AVAILABILITY=true
    MONITORING_ENABLED=true
  EOT
}

output "generated_config" {
  value = local_file.service_config.filename
}