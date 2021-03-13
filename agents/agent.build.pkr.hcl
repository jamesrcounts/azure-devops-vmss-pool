locals {
  bootstrap_scripts = "./bootstrap/scripts/installers"
}

build {
  sources = ["source.azure-arm.agent"]

  provisioner "shell" {
    environment_vars = ["DEBIAN_FRONTEND=noninteractive"]
    execute_command  = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
    scripts = [
      "${local.bootstrap_scripts}/azure-cli.sh",
      "${local.bootstrap_scripts}/basic.sh",
      "${local.bootstrap_scripts}/packer.sh",
      "${local.bootstrap_scripts}/terraform.sh"
    ]
  }
}
