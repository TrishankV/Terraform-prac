# Provider.tf 

terraform { 
    version = ">= 1.4.0"
    required_providers {
        azurerm { 
            source = "hashicorp/azurerm"
            verison = "~> 4.5"
        }
    }
}

provider azurerm { 
    features{}
    skip_provider_registration = true 
}