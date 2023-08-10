resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = local.azure_region
  resource_group_name         = azurerm_resource_group.resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = "c5c5d41a-abc4-441e-8693-7a00f8d24b98"
    object_id = "aef27828-f3e6-4abe-a300-767e32ab535f"

    key_permissions = [
      "Get",
    ]
    secret_permissions = [
      "Get",
    ]
    storage_permissions = [
      "Get",
    ]
  }
}