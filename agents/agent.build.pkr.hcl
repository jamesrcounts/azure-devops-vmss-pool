locals {
  bootstrap_scripts = "${path.root}/scripts/bootstrap"
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
    inline_shebang  = "/bin/sh -x"
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline = [
      "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
    ]
  }
}