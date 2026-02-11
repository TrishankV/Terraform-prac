# vm.tf (WINDOWS )
# this requires a web interface to exist ,

resource "azurerm_windows_virtual_machine" "webvimal" { 
    for_each = var.app_environment.prod.subnets["websubnet01"].machines
    name = each.key
    resource_group_name = local.rgname 
    location = local.loc
    size = "Standard_B2s"
    admin_username = "ajaydevgn"
    admin_password = azurerm_key_vault_secret.vmpass.value
    # availability_set_id = azurerm_availability_set.sett.id
    network_interface_ids = [
        azurerm_network_interface.webnic[each.key].id
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

# vm.tf (LINUX )
# this requires a app interface to exist ,
# The web_subnet would host the windows VM and the App_subnet would host the linux VM which would then host hte static webpage 
resource "azurerm_linux_virtual_machine" "appvimal" { 
    for_each = var.app_environment.prod.subnets["appsubnet01"].machines
    name = each.key
    resource_group_name = local.rgname 
    location = local.loc
    size = "Standard_B2s"
    admin_username = "kinghakla"
      disable_password_authentication = false

    admin_password = azurerm_key_vault_secret.vmpass.value
    # availability_set_id = azurerm_availability_set.sett.id
    network_interface_ids = [
        azurerm_network_interface.appnic[each.key].id
    ]

    os_disk { 
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference { 
        publisher = "Canonical"
        offer = "0001-com-ubuntu-server-jammy"
        sku = "22_04-lts"
        version = "latest"
    }
}