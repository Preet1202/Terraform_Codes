variable "rg_demo" {
  type= string
  default = "rg_demo"
}



variable "function_memory_threshold" {
  type=number
  default=2
}
variable "function_cpu_threshold" {
  type=number
  default=0.0849
}
variable "db_storage_threshold" {
  type=number
  default=2
}


variable "aleart_name_memory" {
  type=string
  default = "function_app_batch_publisher_memory_alert"
}
variable "aleart_name_cpu" {
  type=string
  default = "cpu_utilization"
}
variable "db_storage_cpu" {
  type=string
  default = "db_storage_CPU"
}
variable "db_storage_memory" {
  type=string
  default = "db_storage_memory"
}




variable "metric_name_cpu" {
  type=string
  default = "CpuTime"
}
variable "metric_name_memory" {
  type=string
  default = "AverageMemoryWorkingSet"
}
variable "metric_name_sql_storage_cpu" {
  type=string
  default = "cpu_percent"
}
variable "metric_name_sql_storage_memory" {
  type=string
  default = "sqlserver_process_memory_percent"
}



variable "function_id" {
  type = string
  default = "/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_demo/providers/Microsoft.Web/sites/webapp7359769"
}
variable "action_group_ids" {
  type=string
  default="/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_demo/providers/microsoft.insights/actiongroups/Action_mail"
}
variable "db_id" {
  type=string
  default="/subscriptions/b44a8d87-b902-4c21-93b8-fff65c77b270/resourceGroups/rg_sql_db/providers/Microsoft.Sql/servers/sqlserver73597/databases/SqlDb"
}

variable "alert_notifier_group" {
  type        = map(any)
  description = "Map of users with it's email address to receive notifications."
  default = {
    "Preet"="u1305622@gmail.com"
    "new"="preetpatel02@gmail.com"
  }
}