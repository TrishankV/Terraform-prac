resource "azurerm_windows_web_app" "webapp" {
    for_each =  var.webappenv.prod.serviceapp
    name = each.key
    resource_group_name = local.rgname
    location = local.loc
    service_plan_id = azurerm_service_plan.splan[each.value].id
    # As we mobject as such so we could map the names wihtout being redudnant 
    site_config { 
        always_on = false 
        application_stack {
            current_stack = "dotnet"
            dotnet_version = "v8.0"
        }
    }
}