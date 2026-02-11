# variables.tf 
# Now we are creataingg variables such that it parse as ana environment 


variable "app_environment" {
  type = map(
    object({
      vnname = string
      vncidr = string
      subnets = map(
        object({
          cidr = string
          machines = map(
            object({
              niname       = string
              publibipname = string
            })
          )
        })
      )
    })
  )
}

variable "password" { 
    type = string
    description = "this is for virtual machine "
    sensitive = true 
}
