# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/08-error-handling

ansible-playbook 50.error_handling-1.yml
ansible-playbook 50.error_handling-2.yml
ansible-playbook 50.error_handling-3.yml
ansible-playbook 51.error_hanlding_with_block_rescue_always.yml
