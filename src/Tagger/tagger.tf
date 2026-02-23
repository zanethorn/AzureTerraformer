##############################################################################
# Tagger Helper Module
# This module provides common tagging functionality for all resources.
##############################################################################


##############################################################################
# Naming Variables
##############################################################################

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

variable "index" {
    description = "Global index for resource names (such as sequential numbering)"
    type        = number
    default     = null
}

variable "additional_tags" {
    description = "Additional Tags to apply."
    type        = map(string)
    default     = {}
}

##############################################################################
# Local Variables
##############################################################################


locals {
    common_tags = {
        Environment = var.environment
        Product     = var.product_code
        Module      = var.module_code
        Submodule   = var.submodule_code
        Location    = var.location
        Index       = var.index
    }
}

##############################################################################
# Output Variables
##############################################################################

output "all_tags" {
    value = merge(local.common_tags, var.additional_tags)
}