# provider .tf 

terraform { 
    required_providers { 
        azurerm = { 
            source = "hashicorp/azurerm"
            version = "~4.5.0"
        }
    }
}

provider azurerm { 
    features {}
    skip_provider_resgistration = "true"
}