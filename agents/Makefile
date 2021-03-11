default: validate

fmt:
	cat ./agent.json | jq -rM "." > ./agent.pretty && mv -fb agent.pretty agent.json

syntax:
	packer validate -syntax-only ./agent.json

validate: fmt syntax
	packer validate \
		-var 'managed_image_name=fake' \
		-var 'managed_image_resource_group_name=fake-rg' \
		-var 'location=centralus' \
		./agent.json