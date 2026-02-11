# key vault 

# resource "azurerm_key_vault" "av" { 
#     name = "appvault29853"
#     location = local.loc
#     resource_group_name = local.rgname
#     tenant_id = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
#     soft_delete_retention_days = 7
#     sku_name = "standard"
#     purge_protection_enabled   = true 

# }

data "azurerm_key_vault" "av" { 
    name = "gorjjklfjnj3"
    resource_group_name = local.rgname 
}

resource "azurerm_key_vault_secret" "vmpass"   { 
    name = "vmpass"
    value = var.password
    key_vault_id = azurerm_key_vault.av.id
}