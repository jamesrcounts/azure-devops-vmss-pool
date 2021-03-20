locals {
  scripts           = "${path.root}/scripts"
  remote_scripts    = "/imagegeneration"
  remote_helpers    = "${local.remote_scripts}/helpers"
  bootstrap_scripts = "${local.scripts}/bootstrap"
  helpers           = "${local.scripts}/helpers"
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

  provisioner "shell" {
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
    inline = [
      "mkdir ${local.remote_scripts}",
      "chmod 777 ${local.remote_scripts}"
    ]
  }

  provisioner "file" {
    source      = local.helpers
    destination = local.remote_helpers
  }

  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive",
      "HELPER_SCRIPTS=${local.remote_helpers}"
    ]
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
    scripts = [
      "${local.scripts}/repos.sh",
      "${local.scripts}/docker-moby.sh",
      "${local.scripts}/dotnetcore-sdk.sh"
    ]
  }

  provisioner "shell" {
    inline_shebang  = "/bin/sh -x"
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline = [
      "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
    ]
  }
}