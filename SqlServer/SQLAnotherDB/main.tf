resource "azurerm_mssql_server" "sqlserver38e383e" { 
    for_each = var.sqlenv.prod.server
    name = each.key 
    resource_group_name = local.rgname 
    location = local.loc 
    version = "12.0"
    administrator_login = "HelloKitty"
    administrator_login_password =  "LOLOLOL@112d"
}

resource "azurerm_mssql_database" "sqldb" { 
    for_each = {for detail in local.db_details: detail.database_name => detail}
    name = each.key 
    server_id = azurerm_mssql_server.sqlserver38e383e[each.value.server_name].id
    collation = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 2 
    sku_name = each.value.database_sku
}

resource "azurerm_mssql_database" "adventureworksdb" {
    for_each = { for detail in local.db_details : detail.database_name => detail }
        name = each.key 
    server_id = azurerm_mssql_server.sqlserver38e383e[each.value.server_name].id
    collation = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 2 
    sku_name = each.value.database_sku
}


resource "azurerm_mssql_firewall_rule" "allowmyclient" {
    for_each = var.sqlenv.prod.server
    name = "AllowClientIp"
  server_id = azurerm_mssql_server.sqlserver38e383e[each.key].id
  start_ip_address = "96.204.16.49"
  end_ip_address = "96.204.16.49"
}
