So i tried to implement an sql command in the appdb "empty" database , using a external feature called as sqlcmd , due to the restrictions on pluralsight, I had to look for the latest verison of GO-sql from [Github link]("https://www.github.com/microsoft/go-sqlcmd) and download it in my bash cli . 

Though I added the provisioner as 

``` HCL
resource "null_resource" "database_setup" { 
    provisioner "local-exec" { 
    command = <<EOT
sqlcmd -S ${azurerm_mssql_server.sqlserver38e383e[var.app_setup[0]].fully_qualified_domain_name} \
  -U ${azurerm_mssql_server.sqlserver38e383e[var.app_setup[0]].administrator_login} \
  -P ${azurerm_mssql_server.sqlserver38e383e[var.app_setup[0]].administrator_login_password} \
  -d ${var.app_setup[1]} -i 1.sql
EOT
    
    }

    depends_on = [azurerm_mssql_database.sqldb]
}
```

i will not able to bypass the firewall rules established by azure itself and plurasight sandbox wont let me 

