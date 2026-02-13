

resource "azurerm_service_plan" "splan" {
    for_each = var.webappenv.prod.serviceplan
    name = each.key 
  resource_group_name = local.rgname
  location = local.loc
  os_type = each.value.os_type
  sku_name = each.value.sku
  
}