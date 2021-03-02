resource "azurerm_log_analytics_workspace" "insights" {
  name                = "la-${local.project}-${random_pet.fido.id}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

resource "azurerm_log_analytics_solution" "vminsights" {
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  solution_name         = "VMInsights"
  workspace_name        = azurerm_log_analytics_workspace.insights.name
  workspace_resource_id = azurerm_log_analytics_workspace.insights.id

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/VMInsights"
  }
}