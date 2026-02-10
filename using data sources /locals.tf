# locals.tf

locals{ 
    rgname = "1-f2d521cb-playground-sandbox"
    loc = "eastus"
    vn = { 
        name = "vnet" 
        ad = ["10.0.0.0/16"]
    }
}
   