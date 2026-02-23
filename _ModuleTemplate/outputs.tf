##############################################################################
# This is the outputs.tf file for the [Name] module.  
# It defines all output values for the module.
##############################################################################

##############################################################################
# Resource Outputs
##############################################################################

output "resource_id" {
    description = "The ID of the created [resource]"
    value       = azurerm_resource_group.main.id
}

output "resource_name" {
    description = "The name of the created [resource]"
    value       = azurerm_resource_group.main.name
}


##############################################################################
# Security Outputs
##############################################################################

output "read_ids" {
    description = "List of object IDs with read access to the [resource]"
    value       = module.reader_permissions.assignment_ids
}

output "write_ids" {
    description = "List of object IDs with write access to the [resource]"
    value       = module.writer_permissions.assignment_ids
}