.PHONY: default
default: deploy ;

deploy:
	./deploy.sh

teardown:
	./teardown.sh
