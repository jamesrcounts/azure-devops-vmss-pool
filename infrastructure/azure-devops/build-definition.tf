resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = local.project

  ci_trigger {
    use_yaml = true
  }

  repository {
    branch_name           = "main"
    repo_id               = "jamesrcounts/azure-devops-vmss-pool"
    repo_type             = "GitHub"
    service_connection_id = azuredevops_serviceendpoint_github.endpoint.id
    yml_path              = "agents/azure-pipelines.yml"
  }

  variable {
    name  = "sig_image_version"
    value = "$(Build.BuildNumber)"
  }

  variable {
    name  = "pool"
    value = "ado-vmss-pool-custom"
  }
}