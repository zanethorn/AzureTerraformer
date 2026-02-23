##############################################################################
# This is the variables.tf file for the [Name] module.  
# It defines all input variables for the module.
##############################################################################


##############################################################################
# Naming Variables
##############################################################################


variable "resource_group_name" {
    description = "Name of the resource group this module is contained within."
    type        = string
}

variable "prefix" {
    description = "Global prefix for resource names (such as company id)"
    type        = string
    default     = ""
}

variable "environment" {
    description = "Environment name (dev, staging, prod)"
    type        = string
    validation {
      condition = contains(module.constants.environments, var.environment)
      error_message = "Must be a valid environment name"
    }
}

variable "product_code" {
    description = "Product code or identifier to include in the resource name"
    type        = string
}

variable "module_code" {
    description = "Module code or identifier to include in the resource name"
    type        = string
}

variable "submodule_code" {
    description = "Submodule code or identifier to include in the resource name"
    type        = string
    default = ""
}

variable "location" {
    description = "Azure region"
    type        = string
    default     = config.defaults.location
}

variable "suffix" {
    description = "Global suffix for resource names (such as testing tag)"
    type        = string
    default     = ""
}

variable "index" {
    description = "Global index for resource names (such as sequential numbering)"
    type        = number
    default     = null
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

variable "additional_tags" {
    description = "Additional Tags to apply."
    type        = map(string)
    default     = {}
}

##############################################################################
# Module Specific Variables
##############################################################################
