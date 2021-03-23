locals {
  ops_secrets = [
    "agents-vnet-name",
    "location",
    "packer-subnet-name",
    "rg-images",
    "rg-vnet",
    "sig-name",
    "tf-storage-account",
    "tf-storage-blob-container",
    "tf-storage-rg",
  ]
}

data "azurerm_resource_group" "main" {
  name = "rg-${local.project}"
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