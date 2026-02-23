##############################################################################
# This is the Resource Group module.  It manages resource groups in Azure.
##############################################################################


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

module "resource_namer" {
    source = "../Namer"
    prefix = var.prefix
    resource_abbreviation = constants.resources.resource_group.abbreviation
    environment = var.environment
    product_code = var.product_code
    module_code = var.module_code
    submodule_code = var.submodule
    location = var.location
    suffix = var.suffix
    index = var.index
}

module "tagger" {
    source = "../Tagger"
    environment = var.environment
    product_code = var.product_code
    module_code = var.module_code
    location = var.location
    submodule_code = var.submodule_code
    additional_tags = var.additional_tags
}

##############################################################################
# Resource Definitions
##############################################################################


resource "azurerm_resource_group" "main" {
  name     = module.resource_namer.resource_name
  location = module.constants.regions[var.location].name
  tags = module.tagger.all_tags
}

##############################################################################
# Security and Permissions
##############################################################################

module "reader_permissions" {
    source = "../Permissions"
    ids = var.read_ids
    role = "Reader"
    scope = azurerm_resource_group.main.id
}

module "writer_permissions" {
    source = "../Permissions"
    ids = var.write_ids
    role = "Contributor"
    scope = azurerm_resource_group.main.id
}