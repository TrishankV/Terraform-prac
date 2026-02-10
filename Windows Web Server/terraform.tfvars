# terraform.tfvars 


app_environment = { 
    prod = { 
        vnname = "appvnet"
        vncidr = "10.0.0.0/16"
        subnets = { 
            websubnet01 = {cidr = "10.0.0.0/24"}
            websubnet02 = {cidr =  "10.0.1.0/24"}
        }
        niname = "webinterface01"
        publibipname = "webip01"
        vmname = "webvm01"
    }
}

password = "kmk@#enbbBB"