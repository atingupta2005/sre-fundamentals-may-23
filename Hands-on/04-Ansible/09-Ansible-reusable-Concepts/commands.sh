# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/09-Ansible-reusable-Concepts

ansible-playbook 53.install_multiple_pkgs.yml
ansible-playbook 54.install_multiple_pkgs_with_include_tasks.yml
