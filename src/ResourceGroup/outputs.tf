##############################################################################
# This is the outputs.tf file for the Resource Group module.
##############################################################################

##############################################################################
# Naming Outputs
##############################################################################

output "resource_group_id" {
    description = "The ID of the created resource group"
    value       = azurerm_resource_group.main.id
}

output "resource_group_name" {
    description = "The name of the created resource group"
    value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
    description = "The location of the created resource group"
    value       = azurerm_resource_group.main.location
}

##############################################################################
# Security Outputs
##############################################################################

output "read_ids" {
    description = "List of object IDs with read access to the resource group"
    value       = module.reader_permissions.assignment_ids
}

output "write_ids" {
    description = "List of object IDs with write access to the resource group"
    value       = module.writer_permissions.assignment_ids
}