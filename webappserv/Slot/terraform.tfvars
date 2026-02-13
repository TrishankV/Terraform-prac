webappenv = {
    prod = { 
        serviceplan = {
            splan1234 = { 
                sku = "F1"
                os_type = "Windows"
            }
            splan2 = {
                sku = "F1"
                os_type = "Linux"
            }
        }
        serviceapp = {
            webapp1233 = "splan1234"
            webapp2234 = "splan2"
        }
    }
}

restag = {
  "tags" = {
    dept = "Logistics"
    tier = "Tier3"
  }
}

webslot = ["webapp1233" , "staging"]