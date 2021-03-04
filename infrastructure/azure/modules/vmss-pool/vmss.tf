resource "azurerm_linux_virtual_machine_scale_set" "azp_agents" {
  admin_username              = local.admin_username
  instances                   = 0
  location                    = var.resource_group.location
  name                        = "vmss-${var.project}"
  overprovision               = false
  platform_fault_domain_count = 1
  resource_group_name         = var.resource_group.name
  single_placement_group      = false
  sku                         = local.sku.name
  tags                        = var.tags
  upgrade_mode                = "Manual"

  admin_ssh_key {
    username   = local.admin_username
    public_key = tls_private_key.admin.public_key_openssh
  }

  network_interface {
    name    = "primary"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id

      public_ip_address {
        idle_timeout_in_minutes = 4
        name                    = "public"
      }
    }
  }

  os_disk {
    storage_account_type   = "Standard_LRS"
    caching                = "ReadOnly"
    disk_size_gb           = local.sku.disk_size_gb
    disk_encryption_set_id = var.disk_encryption_set_id

    diff_disk_settings {
      option = "Local"
    }
  }

  source_image_id = var.source_image_id

  dynamic "source_image_reference" {
    for_each = var.source_image_reference[*]
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  lifecycle {
    ignore_changes = [tags, instances]
  }
}