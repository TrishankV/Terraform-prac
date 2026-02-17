locals { 
    rgname =  "1-playground-sandbox"
    loc = "eastus"

    db_details = (flatten ( [
        for skey , ser in var.sqlenv.prod.server : [
            for dbkey , db in ser.dbname : {
                server_name = skey
                database_name = dbkey 
                database_sku = db.sku 
                database_sampledb = db.sampledb
            }]
        
    ]
    ))
}
