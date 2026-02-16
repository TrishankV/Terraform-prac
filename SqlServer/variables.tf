variable "sqlenv"  { 
    type = map(object(
        {
            server = map(object(
                {
                    dbname = string
                    sku = string
                }
            ))
        }
    ))
}