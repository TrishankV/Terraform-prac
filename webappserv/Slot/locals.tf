locals { 
    rgname = "1-c2377a10-playground-sandbox"
    loc = "eastus"

    prodtags = { 
        prod_code = "${var.restag.tags.dept}-${var.restag.tags.tier}"
        prod_tier = "${var.restag.tags.dept}"
    }

}