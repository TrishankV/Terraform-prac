variable "container" { 
    type = map(object({
        blob_name = string       
      }))
}