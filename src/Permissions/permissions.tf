##############################################################################
# This is the Permissions helper module.  It standardizes Azure naming conventions
# across all modules and resources.
#
# This module is intended to be used as a helper.
##############################################################################


##############################################################################
# Input Variables
##############################################################################

variable "ids" {
    description = "List of object IDs with access to the resource"
    type        = list(string)
    default     = []
}

variable "role" {
    description = "Azure role to assign to the object IDs (e.g., 'Reader', 'Contributor')"
    type        = string
    default     = "Reader"
}

variable scope {
    description = "The object ID of the principal to assign the role to"
    type        = string
}

##############################################################################
# Resource Definitions
##############################################################################

resource "azurerm_role_assignment" "assignment" {
  for_each = var.ids
  scope                = each.key
  role_definition_name = var.role
  principal_id         = var.scope
}

##############################################################################
# Output Variables
##############################################################################


output "assignment_ids" {
  value = [for assignment in azurerm_role_assignment.assignment : assignment.id]
}