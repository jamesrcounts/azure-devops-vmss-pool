locals {
  ops_secrets =[
    "agents-subnet-id",            
    "disk-encryption-set-id",      
    "log-analytics-workspace-id",  
    "log-analytics-workspace-key", 
    "rg-images",
    "sig-name",
  ]
}

data "azurerm_key_vault" "ops" {
  name                = "kv-${local.project}-ops"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_key_vault_secret" "secrets" {
  for_each = toset(local.ops_secrets)

  name         = each.key
  key_vault_id = data.azurerm_key_vault.ops.id
}