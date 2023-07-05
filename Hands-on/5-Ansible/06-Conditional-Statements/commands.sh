# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/06-Conditional-Statements

ansible-playbook 42.install_httpd_apche.yml
ansible-playbook 43.usage_of_inline_conditional_statement.yml
ansible-playbook 44.find_largest_number_using_when.yml

