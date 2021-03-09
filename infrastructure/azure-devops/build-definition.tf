resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = local.project
  
  repository {
    branch_name = "main"
    repo_id     = "jamesrcounts/azure-devops-vmss-pool"
    repo_type   = "GitHub"
    yml_path    = "agents/azure-pipelines.yml"
  }
}