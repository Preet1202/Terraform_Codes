resource "azurerm_monitor_action_group" "action_group" {
  name                = "example-action-group"
  resource_group_name = var.rg_demo
  short_name          = "example"
 
  
  dynamic "email_receiver" {
    for_each = var.alert_notifier_group

    content {
      name          = email_receiver.key
      email_address = email_receiver.value
    }
  }
}


resource "azurerm_monitor_metric_alert" "function_atepp_memory_alert" {
 # count               = var.function_id == null || contains(var.disabled_alerts, "function_app_memory_alert") ? 0 : 1
  enabled             = true
  name                = var.aleart_name_memory
  resource_group_name = var.rg_demo
  scopes              = [var.function_id]
  description         = "Action will be triggered when memory usage is greater than 1200 mb, threshold is set in bytes"

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = var.metric_name_memory
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.function_memory_threshold
  }

  action {
    action_group_id = var.azurerm_monitor_action_group.action_group_id
  }
}




resource "azurerm_monitor_metric_alert" "function_atepp_cpu" {
  enabled             = true
  name                = var.aleart_name_cpu
  resource_group_name = var.rg_demo
  scopes              = [var.function_id]

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = var.metric_name_cpu
    aggregation      = "Maximum"
    operator         = "GreaterThan"
    threshold        = var.function_cpu_threshold
  }

  action {
    action_group_id = var.azurerm_monitor_action_group.action_group_id
  }
}


resource "azurerm_monitor_metric_alert" "db_storage_cpu" {
  name                = var.db_storage_cpu
  resource_group_name = var.rg_demo
  scopes              = [var.db_id]
  frequency           = "PT5M"
  window_size         = "PT15M"
  enabled             = true
  severity            = 3 // Infromational, since 80% should be enough warning to make this non-critical

  criteria {
    aggregation      = "Average"
    metric_name      = var.metric_name_sql_storage_cpu
    metric_namespace = "Microsoft.Sql/servers/databases"
    operator         = "GreaterThan"
    threshold        = var.db_storage_threshold
  }

  action {
    action_group_id = var.azurerm_monitor_action_group.action_group_id
  }
}


resource "azurerm_monitor_metric_alert" "db_storage_Memory" {
  name                = var.db_storage_memory
  resource_group_name = var.rg_demo
  scopes              = [var.db_id]
  frequency           = "PT5M"
  window_size         = "PT15M"
  enabled             = true
  severity            = 3 // Infromational, since 80% should be enough warning to make this non-critical

  criteria {
    aggregation      = "Average"
    metric_name      = var.metric_name_sql_storage_memory
    metric_namespace = "Microsoft.Sql/servers/databases"
    operator         = "GreaterThan"
    threshold        = var.db_storage_threshold
  }

  action {
    action_group_id = var.azurerm_monitor_action_group.action_group_id
  }
}