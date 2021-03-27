resource "azuredevops_build_definition" "build" {
  project_id = azuredevops_project.project.id
  name       = local.project

  # ci_trigger {
  #   use_yaml = true
  # }

  ci_trigger {

    override {
      batch                            = false
      max_concurrent_builds_per_branch = 1
      polling_interval                 = 0

      branch_filter {
        exclude = []
        include = ["custom-build"]
      }

      path_filter {
        exclude = []
        include = []
      }
    }
  }

  repository {
    branch_name           = "main"
    repo_id               = "jamesrcounts/azure-devops-vmss-pool"
    repo_type             = "GitHub"
    service_connection_id = azuredevops_serviceendpoint_github.endpoint.id
    yml_path              = "agents/azure-pipelines.yml"
  }

  variable {
    name = "sig_image_version"
    # value = "$(Build.BuildNumber)"
    value = "0.0.101"
  }

  variable {
    name  = "pool"
    value = "ado-vmss-pool-custom"
  }
}