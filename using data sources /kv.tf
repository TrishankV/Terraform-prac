#key vault 


# resource "azurerm_key_vault" "appvault889842342" { 
#     name = "appvault29853"
#     location = local.loc
#     resource_group_name = local.rgname
#     tenant_id = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
#     soft_delete_retention_days = 3 
#     public_protection_enabled = false 
#     sku_name = "standard"

# }

# Data here is used to ïmport"the data that is already present in the azure resource manager .

data "azurerm_key_vault" "appvault3000" { 
    name = "appvault3000"
    resource_group_name = local.rgname 
}

resource "azurerm_key_vault_secret" "vmpass"   { 
    name = "vmpass"
    value = var.password
    key_vault_id = data.azurerm_key_vault.appvault3000.id
}