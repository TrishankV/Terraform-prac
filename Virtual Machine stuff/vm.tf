# vm.tf (WINDOWS )
# this requires a web interface to exist ,

resource "azurerm_windows_virtual_machine" "vimal" { 
    name = "Vmal0${count.index+1}"
    count = var.niccount
    resource_group_name = local.rgname 
    location = local.loc
    size = "Standard_B2s"
    admin_username = "ajaydevgn"
    admin_password = "kesari@54BJK"
    network_interface_ids = [
        azurerm_network_interface.nics[count.index].id
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
