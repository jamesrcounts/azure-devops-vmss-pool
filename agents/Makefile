default: validate

fmt:
	packer fmt .

syntax:
	packer validate -syntax-only .

validate: fmt syntax
	packer validate \
		-var "managed_image_name=fake" \
		-var "managed_image_resource_group_name=fake-rg" \
		-var "location=centralus" \
		-var "sig_image_version=0.0.1" \
		-var "virtual_network_subnet_name=subnet" \
		-var "virtual_network_resource_group_name=rg-vnet" \
		-var "virtual_network_name=vnet" \
		.