# Building a small scare data automated copy "machine"such that it copies data that is inputted from one container in a storage account to another . THis could be done using ADF 
# provider.tf 

terraform { 
    required_version = ">=1.3.0 "
    required_providers { 
        azurerm = { 
            source = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
}

provider "azurerm"  { 
    features {}
    skip_provider_registrations = true 
}