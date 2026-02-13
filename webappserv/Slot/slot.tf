slot.tf 

resource "azurerm_windows_web_app_slot" "slot1" { 
    name = var.webslot[1]
    app_service_id = azurerm_windows_web_app.webapp["${var.webslot[0]}"].id

    site_config { 
        application_stack {
            current_stack = "dotnet"
            dotnet_version = "v8.0"
        }
    }
    depends_on = [azurerm_service_plan.serviceplan]
}
