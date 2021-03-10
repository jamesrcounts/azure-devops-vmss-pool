resource "azurerm_virtual_network" "ops" {
  name                = "network-${local.project}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
  tags                = local.tags
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.ops.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.ops.address_space.0, 8, 2)]
}

resource "azurerm_subnet" "packer" {
  name                 = "packer"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.ops.name
  address_prefixes     = [cidrsubnet(azurerm_virtual_network.ops.address_space.0, 8, 1)]
}