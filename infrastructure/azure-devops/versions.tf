terraform {
  required_version = ">= 0.14"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0"
    }
  }

  backend "remote" {
    organization = "jamesrcounts"

    workspaces {
      name = "azure-devops-vmss-pool-azdo"
    }
  }
}
