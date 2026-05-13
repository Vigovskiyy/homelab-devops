TF_DIR=terraform/proxmox-vm
ANS_DIR=ansible

up:
	terraform -chdir=$(TF_DIR) apply -auto-approve
	ansible-playbook -i $(ANS_DIR)/inventory/hosts.ini $(ANS_DIR)/playbooks/docker.yml

plan:
	terraform -chdir=$(TF_DIR) plan

destroy:
	terraform -chdir=$(TF_DIR) destroy -auto-approve

ping:
	ansible -i $(ANS_DIR)/inventory/hosts.ini all -m ping
