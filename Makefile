.PHONY: default
default: deploy ;

deploy:
	./scripts/deploy.sh

teardown:
	./scripts/teardown.sh

init:
	cd server && terraform init && cd ../rancher-stack && terraform init && cd ../nodes && terraform init && cd ../

plan:
	cd server && terraform plan && cd ../nodes && terraform plan && cd ../
