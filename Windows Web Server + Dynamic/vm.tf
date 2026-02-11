# vm.tf (WINDOWS )
# this requires a web interface to exist ,

resource "azurerm_windows_virtual_machine" "vimal" { 
    for_each = var.app_environment.prod.subnets["websubnet01"].machines
    name = each.key
    resource_group_name = local.rgname 
    location = local.loc
    size = "Standard_B2s"
    admin_username = "ajaydevgn"
    admin_password = azurerm_key_vault_secret.vmpass.value
    # availability_set_id = azurerm_availability_set.sett.id
    network_interface_ids = [
        azurerm_network_interface.[each.key].id
    ]

    os_disk { 
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference { 
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2022-Datacenter"
        version = "latest"
    }
}
