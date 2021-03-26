locals {
  ops_secrets = {
    "agents-subnet-id"            = 1
    "disk-encryption-set-id"      = 1
    "log-analytics-workspace-id"  = 1
    "log-analytics-workspace-key" = 1
  }
}

data "azurerm_key_vault" "ops" {
  name                = "kv-${local.project}-ops"
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_key_vault_secret" "secrets" {
  for_each = local.ops_secrets

  name         = each.key
  key_vault_id = data.azurerm_key_vault.ops.id
}