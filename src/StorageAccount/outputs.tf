##############################################################################
# This is the outputs.tf file for the Storage Account module.  
# It defines all output values for the module.
##############################################################################

##############################################################################
# Resource Outputs
##############################################################################

output "resource_id" {
    description = "The ID of the created storage account"
    value       = azurerm_storage_account.main.id
}

output "resource_name" {
    description = "The name of the created storage account"
    value       = azurerm_storage_account.main.name
}


##############################################################################
# Security Outputs
##############################################################################

output "read_ids" {
    description = "List of object IDs with read access to the storage account"
    value       = module.reader_permissions.assignment_ids
}

output "write_ids" {
    description = "List of object IDs with write access to the storage account"
    value       = module.writer_permissions.assignment_ids
}