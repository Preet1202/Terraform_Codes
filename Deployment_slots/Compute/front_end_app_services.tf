resource "azurerm_linux_web_app" "front_end_web_app" {
  name                = var.front_end_app_name
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  tags                = local.tags
  service_plan_id     = azurerm_service_plan.frontend_service_plan.id
  site_config {
    always_on                = true
    ftps_state               = "FtpsOnly"
    http2_enabled            = true
    remote_debugging_enabled = false
    app_command_line         = "pm2 serve /home/site/wwwroot --no-daemon --spa"
    vnet_route_all_enabled = true
    application_stack {
      node_version = "18-lts"
    }
  }

  identity {
    type = "SystemAssigned"
  }

}
