.PHONY: build-% update-scripts validate-%

%:
	./scripts/create.sh $* $*-20-04

build-%:
	packer build $*/template.pkr.hcl

validate-%:
	packer validate $*/template.pkr.hcl

update-scripts:
	curl -o common/scripts/999-img_check.sh https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/img_check.sh
	curl -o common/scripts/900-cleanup.sh https://raw.githubusercontent.com/digitalocean/marketplace-partners/master/scripts/cleanup.sh
