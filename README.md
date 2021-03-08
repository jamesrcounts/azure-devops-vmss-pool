# Azure DevOps VMMS Agent Pools

1. Terraform: plan and apply `infrastructure/azure/base` to create all the initial resources in Azure.
2. Terraform: plan and apply `infrastructure/azure-devops` to create an Azure DevOps project to host the packer pipeline.