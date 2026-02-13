# variables.tf 

variable "webappenv" {
    type = map (
        object{
            serviceplan = map ( 
                object (
                sku = string 
                os_type = string 
            ))
            serviceapp = map(string)
        }
    )
}