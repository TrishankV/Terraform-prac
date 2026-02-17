variable "sqlenv"  { 
    type = map(object(
        {
            server = map(object(
                {
                    dbname = map ( object ( 
                        { 
                            sku = string 
                            sampledb = string
                        }
                    ))
                }
            ))
        }
    ))
}
