resource "azuredevops_serviceendpoint_azurerm" "endpoint" {
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name
  description               = "Managed by Terraform"
  project_id                = azuredevops_project.project.id
  service_endpoint_name     = "Azure"

  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }
}

