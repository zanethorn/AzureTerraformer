
output environments {
    value=["dev","test", "staging", "prod"]
}

output resources {
    value={
        resource_group = {
            name = "Resource Group"
            abbreviation = "rg"
        },
        storage_account = {
            name = "Storage Account"
            abbreviation = "st"
        }
    }
}