resource "azurerm_service_plan" "frontend_service_plan" {
  name                = var.frontend_service_plan_name
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  os_type             = var.frontend_service_plan_os_type
  sku_name            = var.frontend_service_plan_sku_name
  tags                = local.tags
}
# Create Linux web App for Front End
resource "azurerm_linux_web_app" "front_end_web_app" {
  name                = var.fnapp
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  tags                = local.tags
  service_plan_id     = azurerm_service_plan.frontend_service_plan.id
  https_only          = true
  site_config {
    always_on                = true
    ftps_state               = "FtpsOnly"
    http2_enabled            = true
    remote_debugging_enabled = false
    application_stack {
      node_version = "18-lts"
    }
    ip_restriction{
    virtual_network_subnet_id ="/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_terraform/providers/Microsoft.Network/virtualNetworks/vnet111/subnets/default"
    }
  }


  
}


resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  app_service_id  ="/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_terraform/providers/Microsoft.Web/sites/fnapppew"
  subnet_id       = "/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_terraform/providers/Microsoft.Network/virtualNetworks/vnet111/subnets/subnet11"
}


