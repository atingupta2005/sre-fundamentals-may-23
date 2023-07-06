# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/03-Playbooks


ansible-playbook install_wget.yml
ansible-playbook install_nginx.yml
ansible-playbook uninstall_wget_nginx.yaml
