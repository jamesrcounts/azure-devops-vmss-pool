resource "azuredevops_variable_group" "variablegroup" {
  project_id   = azuredevops_project.project.id
  name         = local.project
  description  = "Variables for ${local.project} packer pipelines"
  allow_access = false

  variable {
    name  = "AZURE_RESOURCE_GROUP_IMAGES"
    value = data.azurerm_key_vault_secret.secrets["rg-images"].value
  }

  variable {
    name  = "AZURE_LOCATION"
    value = data.azurerm_key_vault_secret.secrets["location"].value
  }

  variable {
    name  = "BUILD_AGENT_VNET_NAME"
    value = data.azurerm_key_vault_secret.secrets["agents-vnet-name"].value
  }

  variable {
    name  = "BUILD_AGENT_VNET_RESOURCE_GROUP"
    value = data.azurerm_key_vault_secret.secrets["rg-vnet"].value
  }

  variable {
    name  = "PACKER_SUBNET_NAME"
    value = data.azurerm_key_vault_secret.secrets["packer-subnet-name"].value
  }

  variable {
    name  = "PRIVATE_VIRTUAL_NETWORK_WITH_PUBLIC_IP"
    value = true
  }

  variable {
    name  = "SIG_NAME"
    value = data.azurerm_key_vault_secret.secrets["sig-name"].value
  }

  variable {
    name  = "TF_STORAGE_ACCOUNT"
    value = data.azurerm_key_vault_secret.secrets["tf-storage-account"].value
  }


  variable {
    name  = "TF_STORAGE_BLOB_CONTAINER"
    value = data.azurerm_key_vault_secret.secrets["tf-storage-blob-container"].value
  }

  variable {
    name  = "TF_STORAGE_RG"
    value = data.azurerm_key_vault_secret.secrets["tf-storage-rg"].value
  }
}