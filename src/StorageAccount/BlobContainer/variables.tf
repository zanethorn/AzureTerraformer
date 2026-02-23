##############################################################################
# This is the variables.tf file for the Blob Container module.  
# It defines all input variables for the module.
##############################################################################


##############################################################################
# Naming Variables
##############################################################################


variable "name" {
    description = "Name of the blob container."
    type        = string
}

variable "storage_account_id" {
    description = "The ID of the storage account to create the blob container in."
    type        = string
}

variable "container_access_type" {
    description = "The access type of the blob container. Possible values are: 'private', 'blob', 'container'."
    type        = string
    default     = "private"
}

##############################################################################
# Security Variables
##############################################################################

variable "read_ids" {
    description = "List of object IDs with read access to the resource group"
    type        = list(string)
    default     = []
}

variable "write_ids" {
    description = "List of object IDs with write access to the resource group"
    type        = list(string)
    default     = []
}

##############################################################################
# Tagging Variables
##############################################################################

variable "metadata_tags" {
    description = "Additional Tags to apply."
    type        = map(string)
    default     = {}
}
