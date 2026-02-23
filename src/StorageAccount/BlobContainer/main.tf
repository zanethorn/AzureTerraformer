##############################################################################
# This is the Blob Container module.  It manages Blob Containers in Azure.
##############################################################################

provider "azurerm" {
    features {}
}


##############################################################################
# Module Imports
# Place any module imports here.
##############################################################################

module "constants" {
    source = "../Constants"
}

module "config" {
    source = "../Config"
}


##############################################################################
# Resource Definitions
##############################################################################

resource "azurerm_storage_container" "main" {
  name                  = var.name
  storage_account_id    = var.storage_account_id
  container_access_type = var.container_access_type

  metadata = var.metadata_tags
}