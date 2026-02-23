##############################################################################
# This is the Namer helper module.  It standardizes Azure naming conventions
# across all modules and resources.
#
# This module is intended to be used as a helper.
##############################################################################


##############################################################################
# Imported modules
##############################################################################


module "constants" {
    source = "../Constants"
}

module "config" {
    source = "../Config"
}

##############################################################################
# Input Variables
##############################################################################


variable "resource_pattern" {
    description = "Naming pattern for resources"
    type        = string
    default     = "${prefix}${resource_abbreviation}${module}${location}${suffix}"
}

variable "storage_pattern" {
    description = "Naming pattern for resources"
    type        = string
    default     = "${prefix}${resource_abbreviation}${module}${location}${suffix}"
}

variable "prefix" {
    description = "Global prefix for resource names (such as company id)"
    type        = string
    default     = ""
}

variable "resource_abbreviation" {
    description = "Abbreviation for the resource type (e.g., 'vm' for virtual machines)"
    type        = string
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
# Locals
##############################################################################


locals{
    resource_prefix = var.prefix != "" ? "${var.prefix}-" : ""
    resource_abbreviation = var.resource_abbreviation != "" ? "${var.resource_abbreviation}-" : ""
    resource_module = "-${var.product_code}${var.module_code}${var.submodule_code}"
    resource_location = "-${var.location}${var.environment}"
    resource_index = var.index != null ? format("%04d", var.index) : ""
    resource_suffix= var.suffix!="" || var.index != null?  "-${var.suffix}${local.resource_index}" : ""

    storage_prefix = var.prefix != "" ? "${var.prefix}" : ""
    storage_abbreviation = var.resource_abbreviation != "" ? "${var.resource_abbreviation}" : ""
    storage_module = "${var.product_code}${var.module_code}${var.submodule_code}"
    storage_location = "${var.location}${var.environment}"
    storage_index = var.index != null ? format("%04d", var.index) : ""
    storage_suffix= var.suffix!="" || var.index != null?  "${var.suffix}${local.storage_index}" : ""

}

##############################################################################
# Output Names
##############################################################################


output "resource_name" {
    value = format(var.resource_pattern, {
        prefix = local.resource_prefix,
        resource_abbreviation = local.resource_abbreviation,
        module = local.resource_module
        location = local.resource_location
        suffix = local.resource_suffix
    })
}

output "storage_name" {
    value = format(var.storage_pattern, {
        prefix = local.storage_prefix,
        resource_abbreviation = local.storage_abbreviation,
        module = local.storage_module
        location = local.storage_location
        suffix = local.storage_suffix
    })
}