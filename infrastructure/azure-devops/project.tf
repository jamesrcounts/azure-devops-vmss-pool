resource "azuredevops_project" "project" {
  name               = local.project
  description        = "Packer Pipelines"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_project_features" "project-features" {
  project_id = azuredevops_project.project.id
  features = {
    "artifacts"    = "disabled"
    "boards"       = "disabled"
    "pipelines"    = "enabled"
    "repositories" = "disabled"
    "testplans"    = "disabled"
  }
}