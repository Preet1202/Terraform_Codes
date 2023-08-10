resource "azurerm_service_plan" "frontend_service_plan" {
  name                = var.frontend_service_plan_name
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  os_type             = var.frontend_service_plan_os_type
  sku_name            = var.frontend_service_plan_sku_name
  tags                = local.tags
}
# Create Linux web App for Front End
resource "azurerm_linux_web_app" "front_end_web_app_1" {
  name                = var.fnapp1
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
    virtual_network_subnet_id = azurerm_subnet.subnet2.id
    }
  }
}

resource "azurerm_linux_web_app" "front_end_web_app_2" {
  name                = var.fnapp2
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
  }
  virtual_network_subnet_id = azurerm_subnet.subnet2.id
}

# resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
#   app_service_id  =azurerm_linux_web_app.front_end_web_app_2.id
#   subnet_id       = azurerm_subnet.subnet2.id
# }




# {
#   APPINSIGHTS_INSTRUMENTATIONKEY = "6c1ce16a-3491-4b88-a74d-3883ae9a966d"
#   APPLICATIONINSIGHTS_CONNECTION_STRING = "InstrumentationKey=6c1ce16a-3491-4b88-a74d-3883ae9a966d;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/"
#   AzureWebJobsDashboard = "DefaultEndpointsProtocol=https;AccountName=normandyfiledevelopment;AccountKey=qUljJgiQu5s6DiOd5K+ddViwpedwMD6CZ0i99rfwZlDyHhZsKhC5187rdWIF4g1eL9Pzm0QsiPzB+AStB5pHkA==;EndpointSuffix=core.windows.net"
#   AzureWebJobsStorage = "DefaultEndpointsProtocol=https;AccountName=normandyfiledevelopment;AccountKey=qUljJgiQu5s6DiOd5K+ddViwpedwMD6CZ0i99rfwZlDyHhZsKhC5187rdWIF4g1eL9Pzm0QsiPzB+AStB5pHkA==;EndpointSuffix=core.windows.net"
#   ENABLE_ORYX_BUILD = "true"
#   FUNCTION_APP_EDIT_MODE = "readwrite"
#   FUNCTIONS_EXTENSION_VERSION = "~4"
#   FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
#   NormandyEntities = "metadata=res://*/Model.csdl|res://*/Model.ssdl|res://*/Model.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=whizzbridge-dev123.database.windows.net;initial catalog=normandy-dev;persist security info=True;user id=wb-admin;password=EdqUk7p7zDK7Ars;MultipleActiveResultSets=True;App=EntityFramework&quot;"
#   SalesforceBaseURL = "https://normandyinsurance--imgpartial.sandbox.my.salesforce.com"
#   SalesforceClientId = "3MVG9rrOVHA54N6PhqsipFAG6iUsk7.UEqbpPhpensG97kR0jdWC3cUh0cDDnAd0ErVRzRJSEEEu7UOI.u2sI"
#   SalesforceClientSecret = "E857A4E6CAFF7F34821EDD3EF3CB1976BC1CD938083FD10F4C6B12E1BAB09B28"
#   SalesForceCredentialPassword = "Murtaza@1234"
#   SalesForceCredentialUsername = "murtaza.farooqi@whizzbridge.com.imgpartial"
#   SCM_DO_BUILD_DURING_DEPLOYMENT = "false"
#   TIMMER_FREQUENCY = "0 0 */2 * * *"
#   WEBSITE_CONTENTAZUREFILECONNECTIONSTRING = "DefaultEndpointsProtocol=https;AccountName=normandyfiledevelopment;AccountKey=qUljJgiQu5s6DiOd5K+ddViwpedwMD6CZ0i99rfwZlDyHhZsKhC5187rdWIF4g1eL9Pzm0QsiPzB+AStB5pHkA==;EndpointSuffix=core.windows.net"
#   WEBSITE_CONTENTSHARE = "salesforce-integration-development-4ac0a067"
#   WEBSITE_RUN_FROM_PACKAGE = "1"
# }



