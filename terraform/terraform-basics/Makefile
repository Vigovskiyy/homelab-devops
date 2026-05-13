.PHONY: init plan apply destroy clean output

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

clean:
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate* *.txt *.yaml

output:
	terraform output

refresh:
	terraform refresh
	terraform output

all: init apply output
