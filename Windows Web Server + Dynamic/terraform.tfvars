# terraform.tfvars 


app_environment = { 
    prod = { 
        vnname = "appvnet"
        vncidr = "10.0.0.0/16"
        subnets = { 
            websubnet01 = {
                cidr = "10.0.0.0/24"
                machines = { 
                    webvm01 = {
                        niname = "webinterface01"
                        publibipname = "webip01"

                    }
                }
                }
            websubnet02 = {
                cidr =  "10.0.1.0/24"
                webvm02 = { 
                    niname = "webinterface02"
                    publibipname = "webip02"
                }
                }
        }

    }
}

password = "kmk@#enbbBB"
