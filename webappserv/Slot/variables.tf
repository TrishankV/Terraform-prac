# variables.tf 

variable "webappenv" {
    type = map(object({
            serviceplan = map ( 
                object ({
                sku = string 
                os_type = string }
            ))
            serviceapp = map(string)
        }
    )
    )
}

variable "restag" {
    type = map(object({
      dept = string
      tier = string 
    }))
  
}

variable "webslot" { 
    type = list(string) 
}