plan:
	terraform -chdir=terraform/proxmox-vm plan

apply:
	terraform -chdir=terraform/proxmox-vm apply -auto-approve

ping:
	ansible -i ansible/inventory/hosts.ini all -m ping

docker:
	ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/docker.yml --roles-path ansible/roles

nginx:
	ansible-playbook -i ansible/inventory/hosts.ini ansible/playbooks/nginx.yml --roles-path ansible/roles
