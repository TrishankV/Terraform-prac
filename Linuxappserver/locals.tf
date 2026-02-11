# locals.tf
# Editing locals tf to save hte dynamic blocks of nsg security rules 
locals{ 
    rgname = "1-2d8ce77b-playground-sandbox"
    loc = "eastus"


    nsg_security_rules = [
        {
            priority = 300
            destination_port_range = "3389"
        } , 
        { 
            priority = 310
            destination_port_range = "80"
        }

        priority = 320
            destination_port_range = "22"
    ]
}
   