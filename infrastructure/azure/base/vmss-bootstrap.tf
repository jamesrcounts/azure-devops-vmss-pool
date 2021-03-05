module "vmss_bootstrap" {
  source = "github.com/jamesrcounts/azure-devops-vmss-pool.git//infrastructure/azure/modules/vmss-pool"

  disk_encryption_set_id = azurerm_disk_encryption_set.des.id
  project                = "${local.project}-bootstrap"
  resource_group         = azurerm_resource_group.main
  sku                    = "Standard_D4ds_v4"
  subnet_id              = azurerm_subnet.internal.id
  tags                   = local.tags

  source_image_reference = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18_04-lts-gen2"
    version   = "latest"
  }

  log_analytics_workspace = {
    workspace_id       = azurerm_log_analytics_workspace.insights.workspace_id
    primary_shared_key = azurerm_log_analytics_workspace.insights.primary_shared_key
  }
}