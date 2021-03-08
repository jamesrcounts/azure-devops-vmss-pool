default: apply

connect:
	terraform init -get=false

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade

validate:
	AZDO_GITHUB_SERVICE_CONNECTION_PAT="fake" terraform validate

apply: fmt connect validate
	terraform apply