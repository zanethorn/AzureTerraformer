##############################################################################
# This is the Storage Account module.  It manages Storage Accounts in Azure.
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

module "namer" {
    source = "../Namer"
}

module "tagger" {
    source = "../Tagger"
}


##############################################################################
# Resource Definitions
##############################################################################


resource "azurerm_storage_account" "main" {
  name                     = module.namer.storage_name
  resource_group_name      = var.resource_group_name
  location                 = module.constants.regions[var.location].name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = module.tagger.all_tags
}


##############################################################################
# Security and Permissions
##############################################################################

module "reader_permissions" {
    source = "../Permissions"
    ids = var.read_ids
    role = "Reader"
    scope = azurerm_storage_account.main.id
}

module "writer_permissions" {
    source = "../Permissions"
    ids = var.write_ids
    role = "Contributor"
    scope = azurerm_storage_account.main.id
}

##############################################################################
# Security and Permissions
##############################################################################
