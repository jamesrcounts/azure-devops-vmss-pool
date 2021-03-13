default: validate

fmt:
	packer fmt .

syntax:
	packer validate -syntax-only .

validate: fmt syntax
	packer validate \
		-var "client_id=fake" \
		-var "client_secret=fake" \
		-var "location=centralus" \
		-var "managed_image_name=fake" \
		-var "managed_image_resource_group_name=fake-rg" \
		-var "sig_image_version=0.0.1" \
		-var "sig_name=fake" \
		-var "subscription_id=fake" \
		-var "tenant_id=fake" \
		-var "virtual_network_name=vnet" \
		-var "virtual_network_resource_group_name=rg-vnet" \
		-var "virtual_network_subnet_name=subnet" \
		.