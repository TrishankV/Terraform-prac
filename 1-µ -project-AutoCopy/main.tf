
# Storage Account 

resource "azurerm_storage_account" "saac" { 
  name                     = "copier123sdff34"
  resource_group_name      = local.rgname
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}

resource "azurerm_storage_container" "con1" {
  for_each           = var.container
  name               = each.key
  storage_account_name = azurerm_storage_account.saac.name
}

# resource "azurerm_storage_blob" "bob" { 
#   for_each               = var.container
#   name                   = each.value.blob_name
#   storage_account_name   = azurerm_storage_account.saac.name
#   storage_container_name = each.key 
#   type                   = "Block"
# }


# Data Factory


resource "azurerm_data_factory" "factory" {
  name                = "cope"
  resource_group_name = local.rgname
  location            = local.location
}


# Linked Service


resource "azurerm_data_factory_linked_service_azure_blob_storage" "linkingblobs" {
  name                = "connections"
  data_factory_id     = azurerm_data_factory.factory.id 
  connection_string   = azurerm_storage_account.saac.primary_connection_string 
}


# Dataset


resource "azurerm_data_factory_dataset_delimited_text" "dataaa" {
  for_each = var.container

  name                 = "ds_${each.key}"
  data_factory_id      = azurerm_data_factory.factory.id
  linked_service_name  = azurerm_data_factory_linked_service_azure_blob_storage.linkingblobs.name
  parameters = { 
    FileName = "string"  
    }
  azure_blob_storage_location { 
    container = each.key
    # filename  = each.value.blob_name
    filename = "@dataset().FileName"
    path      = ""
  }

  column_delimiter = ","
}


# Pipeline


resource "azurerm_data_factory_pipeline" "pipe" {
  name            = "piipee"
  data_factory_id = azurerm_data_factory.factory.id
  parameters = { 
    FileName = "String"
  }

  activities_json = <<JSON
[
  {
    "name": "Copy_container1",
    "type": "Copy",

    "inputs": [
      {
        "referenceName": "ds_cont1",
        "type": "DatasetReference",

        "parameters": {
          "FileName": "@pipeline().parameters.FileName"
        }
      }
    ],

    "outputs": [
      {
        "referenceName": "ds_cont2",
        "type": "DatasetReference",

        "parameters": {
          "FileName": "@pipeline().parameters.FileName"
        }
      }
    ],

    "typeProperties": {
      "source": {
        "type": "BlobSource"
      },
      "sink": {
        "type": "BlobSink"
      }
    }
  }
]
JSON
depends_on = [ azurerm_data_factory_dataset_delimited_text.dataaa ]
}


# Trigger 


resource "azurerm_data_factory_trigger_blob_event" "killlakill" {
  name            = "Ryuukou"
  data_factory_id = azurerm_data_factory.factory.id

  pipeline {
    name = azurerm_data_factory_pipeline.pipe.name
    
  parameters = { 
    FileName = "@triggerBody().fileName"
  }
  }


  storage_account_id          = azurerm_storage_account.saac.id
  # storage_linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.linkingblobs.name

  events = [
    "Microsoft.Storage.BlobCreated",
  ]

 
  blob_path_begins_with = "/cont1/"
}
