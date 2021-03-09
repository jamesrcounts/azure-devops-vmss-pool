variable "client_id" {
  description = "Service Principal ID for the AzureRM Service Connection"
  type        = string
}

variable "client_secret" {
  description = "Password for the AzureRM Service Connection"
  sensitive   = true
  type        = string
}

variable "github_pat" {
  description = "GitHub Personal Access Token"
  sensitive   = true
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID for the AzureRM Service Connection"
  type        = string
}

variable "subscription_name" {
  description = "Subscription name for the AzureRM Service Connection"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID for the AzureRM Service Connection"
  type        = string
}