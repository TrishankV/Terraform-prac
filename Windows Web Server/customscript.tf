# customscript.tf

# creating/using a storage account to store 
# the powershell script in it via BLOBS 

data "azurerm_storage_account" "mounted" { 
    name = "frwnnjlfweljnljnde"
    resource_group_name = local.rgname

}

resource "azurerm_storage_container" "scripts" { 
    name = "scripts"
    storage_account_name = data.azurerm_storage_account.mounted.name 
    container_access_type= "blob"
}

resource "azurerm_storage_blob" "bobiis" { 
    name = "IIS.ps1"
    storage_account_name = data.azurerm_storage_account.mounted.name 
    storage_container_name = azurerm_storage_container.scripts.name
    type = "Block"
    source = "IIS.ps1"
}

# for executing the powershell script on the vm 

resource "azurerm_virtual_machine_extension" "vmex" {
    name = "vmex"
    virtual_machine_id = azurerm_windows_virtual_machine.vimal.id
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.10"
      settings = <<SETTINGS
    {
        "fileUris": ["https://${data.azurerm_storage_account.mounted.name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.bobiis.source}"],
          "commandToExecute": "powershell -ExecutionPolicy Unrestricted -file ${azurerm_storage_blob.bobiis.source}"     
    }
SETTINGS

}