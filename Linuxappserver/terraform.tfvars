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
            appsubnet01 = {
                cidr =  "10.0.1.0/24"
                machines = { 
                    appvm01 = { 
                    niname = "appinterface01"
                    publibipname = "appip02"
                }
                }
            }
        }

    }
}

password = "kmk@#enbbBB"