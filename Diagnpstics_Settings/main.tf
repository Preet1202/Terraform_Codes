terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# resource "azurerm_monitor_diagnostic_setting" "vnet" {
#   name               = "setByTerraform"
#   target_resource_id = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/Hippa/providers/Microsoft.Network/virtualNetworks/VnHippa"
#   storage_account_id = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/new/providers/Microsoft.Storage/storageAccounts/new12345forstore"
# #   enabled_log {
# #     category = "VMProtectionAlerts"
# #   }
#   metric {
#     category = "AllMetrics"
#     enabled  = true
#   }
# }

# resource "azurerm_monitor_diagnostic_setting" "nsg" {

#   name               = "setbypolicy"
#   target_resource_id = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/Hippa/providers/Microsoft.Network/networkSecurityGroups/nsghippa"
#   storage_account_id = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/new/providers/Microsoft.Storage/storageAccounts/new12345forstore"

#   dynamic "enabled_log" {
#     for_each = toset(["NetworkSecurityGroupEvent", "NetworkSecurityGroupRuleCounter"])
#     content {
#       category = enabled_log.value
#     }
#   }
# }

# resource "azurerm_network_watcher" "example" {
#   name                = "example-network-watcher"
#   location            = "centralindia"
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_network_security_group" "example" {
#   name                = "example-nsg"
#   location            = "centralindia"
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_storage_account" "example" {
#   name                     = "examplestorageaccount"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = "centralindia"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }



resource "azurerm_monitor_diagnostic_setting" "nsg" {
  name                       = "setbyterra"
  target_resource_id         = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/Hippa/providers/Microsoft.Network/networkSecurityGroups/nsghippa"
  storage_account_id         = "/subscriptions/e4af2321-c6cb-4f99-9c9f-f0ef54f9fa44/resourceGroups/new/providers/Microsoft.Storage/storageAccounts/new12345forstore"

  log {
    category = "NetworkSecurityGroupEvent"
    enabled  = true
  }
}