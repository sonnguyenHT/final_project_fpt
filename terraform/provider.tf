terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "2.13.0"
    }
  }
}

provider "grafana" {
  url  = "https://grafana.thaison.cloud/"
  auth = var.grafana_auth
#   tls_cert = file("${path.module}/certs/cert1.pem")
#   tls_key = file("${path.module}/certs/privkey1.pem")
  ca_cert = "certs/cert1.pem"
}

// Optional (On-premise, not supported in Grafana Cloud): Create an organization
resource "grafana_organization" "my_org" {
  name = "FPT final"
}

// Create resources (optional: within the organization)
resource "grafana_folder" "my_folder" {
  org_id = grafana_organization.my_org.org_id
  title  = "Test Folder"
}

resource "grafana_dashboard" "test_folder" {
  org_id = grafana_organization.my_org.org_id
  folder = grafana_folder.my_folder.id
#   config_json = jsonencode({
#     "title" : "My Dashboard Title",
#     "uid" : "my-dashboard-uid"
#     // ... other dashboard properties
#   })
  config_json = file("${path.module}/dashboards/NodeExporter.json")
}