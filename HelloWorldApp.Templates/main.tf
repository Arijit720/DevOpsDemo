terraform {
  required_version = "> 0.12.0"
# The below section if not specified the terraform.tfstate file is created in current directory of your machine.
  backend "azurerm" {
    storage_account_name = "amdoxstorageacc"
    container_name = "tfstate"
    key = "terraform.tfstate"
    access_key = "lfhzdAFfSftDnJH0ScvtzfggosV8XE9tCHyTcNn8Fg6kJpofwv3n5X9qD0yAVAYjFDmRIGa4pZY+lDQnlW/Xow=="
    features{}
  }
}
# Configure the Azure provider
#Terraform relies on plugins called "providers" to interact with remote systems.
provider "azurerm" { 
    version = "~>2.0"    
    subscription_id = "51081bf2-da0d-4998-9462-b59b512f8690"
    client_id = "5ab99824-a429-42a7-bd68-df79504a6f62"
    client_secret = "C1n-Zbab92w_M3iiA26Y3VHI_i~KIqE7j2"
    tenant_id = "82d8af3b-d3f9-465c-b724-0fb186cc28c7"

    # The "feature" block is required for AzureRM provider 2.x. 
    #If you are using version 1.x, the "features" block is not allowed.
    #It's possible to configure the behaviour of certain resources using the features block
    features {}
}

variable "resource_group_name" {
  default = "my-rg"
  description = "The name of the resource group"
}
variable "resource_group_location" {
  default = "westus"
  description = "The location of the resource group"
}
variable "app_service_plan_name" {
  default     = "my-asp"
  description = "The name of the app service plan"
}
variable "app_service_name_prefix" {
  default     = "my-appsvc"
  description = "The beginning part of the app service name"
}

resource "random_integer" "app_service_name_suffix" {
  min = 1000
  max = 9999
}

#Creating a Resource Group
resource "azurerm_resource_group" "my" { # "azurerm_resource_group" is type and "my" is local name
  name     = var.resource_group_name
  location = var.resource_group_location
}
#Creating an App Service Plan
resource "azurerm_app_service_plan" "my" {   # "azurerm_app_service_plan" is type and "my" is local name
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.my.location
  resource_group_name = azurerm_resource_group.my.name
  kind                = "Linux"
  reserved         = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}
#Creating an App Service 
resource "azurerm_app_service" "my" {
  name                = "${var.app_service_name_prefix}-${random_integer.app_service_name_suffix.result}"
  location            = azurerm_resource_group.my.location
  resource_group_name = azurerm_resource_group.my.name
  app_service_plan_id = azurerm_app_service_plan.my.id
}
output "website_hostname" {
  value       = azurerm_app_service.my.default_site_hostname
  description = "The hostname of the website"
}
