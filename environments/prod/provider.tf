terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }

}

provider "azurerm" {
  features {}
  subscription_id = "bfab1c9c-cf90-4ad8-8ab7-40918bce79a9"
}

locals {
  project_name = "HCL_azure"
  environment  = "dev"
}
