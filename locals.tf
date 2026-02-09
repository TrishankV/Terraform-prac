# locals.tf

locals{ 
    rgname = "1-56549f7d-playground-sandbox"
    loc = "eastus"
    vn = { 
        name = "vnet" 
        ad = ["10.0.0.0/16"] # for creating multiple subnets 
    }
}
   
