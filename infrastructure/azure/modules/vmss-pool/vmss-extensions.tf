
resource "azurerm_virtual_machine_scale_set_extension" "oms_agent" {
  auto_upgrade_minor_version   = true
  name                         = "OMSExtension"
  publisher                    = "Microsoft.EnterpriseCloud.Monitoring"
  type                         = "OmsAgentForLinux"
  type_handler_version         = "1.4"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.azp_agents.id

  settings = jsonencode({
    "azureResourceId"           = azurerm_linux_virtual_machine_scale_set.azp_agents.id
    "stopOnMultipleConnections" = true
    "workspaceId"               = local.workspace.workspace_id
  })

  protected_settings = jsonencode({
    "workspaceKey" = local.workspace.primary_shared_key
  })
}

resource "azurerm_virtual_machine_scale_set_extension" "dependency_agent" {
  auto_upgrade_minor_version   = true
  name                         = "DependencyAgentLinux"
  publisher                    = "Microsoft.Azure.Monitoring.DependencyAgent"
  type                         = "DependencyAgentLinux"
  type_handler_version         = "9.5"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.azp_agents.id
}