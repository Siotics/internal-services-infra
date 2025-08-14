default: list

.PHONY: default list build deploy test

list:
	@echo "Available commands:"
	@grep -E '^[a-zA-Z0-9_-]+:([^=]|$$)' Makefile \
		| cut -d: -f1 \
		| grep -vE '^(default|list)$$' \
		| sort \
		| uniq \
		| sed 's/^/ - /'

baremetal-install:
	@echo "Setup & Install Baremetal Server"
	@make ansible-roles-install

exit-node-install:
	@echo "Setup & Install Exit Node Server"
	@make ansible-roles-install	

deploy:
	@echo "Deply K3s Cluster Config"

ansible-roles-install:
	@echo "Install required ansible roles"
	@cd ./ansible && ansible-galaxy install -r ./requirements.yaml
