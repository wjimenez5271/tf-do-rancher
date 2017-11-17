.PHONY: default
default: deploy ;

deploy:
	./deploy.sh

teardown:
	./teardown.sh

init:
	cd server && terraform init && cd ../nodes && terraform init && cd ../

plan:
	cd server && terraform plan && cd ../nodes && terraform plan && cd ../
