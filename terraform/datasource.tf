resource "grafana_data_source" "prometheus" {
  type                = "prometheus"
  name                = "Promethues"
  url                 = "https://prometheus.thaison.cloud"
  basic_auth_enabled  = false
  access_mode = "proxy"
  org_id = resource.grafana_organization.my_org.id
  is_default = true
  
#   basic_auth_username = "username"

#   json_data_encoded = jsonencode({
#     httpMethod        = "POST"
#     prometheusType    = "Mimir"
#     prometheusVersion = "2.4.0"
#   })

#   secure_json_data_encoded = jsonencode({
#     basicAuthPassword = "password"
#   })
}