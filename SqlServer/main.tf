resource "azurerm_mssql_server" "sqlserver" { 
    for_each = var.sqlenv.prod.server
    name = each.key 
    resource_group_name = local.rgname 
    location = local.rgname 
    version = "12.0"
    administrator_login = "HelloKitty"
    administrator_login_password =  "LOLOLOL@112d"
}

resource "azreurm_mssql_database" "sqldb" { 
    for_each = var.sqlenv.prod.server
    name = each.key 
    server_id = azurerm_mssql_server.sqlserver[each.key].id
    collation = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 2 
    sku_name = each.value.sku

}

# Adding a Firewall Rule

resource "azurerm_mssql_firewall_rule" "allowmyclient" {
    name = "AllowClientIp"
  server_id = azurerm_mssql_server.sqlserver321e12["serverloli"]
  start_ip_address = "96.204.16.49"
  end_ip_address = "96.204.16.49"
}
