# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/12-misc-modules

ansible-playbook misc-modules-1.yaml

ansible-playbook misc-modules-2.yaml
ansible-playbook run-local-script-on-remote.yaml
ansible-playbook selinux.yaml
ansible-playbook seboolean.yaml

