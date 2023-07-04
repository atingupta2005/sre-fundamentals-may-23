# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/07-Handlers-Loops-and-Tags

ansible-playbook 45.concepts_of_handlers.yml
ansible-playbook 46.install_multiple_pkgs_without_loops.yml
ansible-playbook 47.install_multiple_pkgs_with_loops.yml
ansible-playbook 47.uninstall_multiple_pkgs_with_loops.yml

# How to list all tags ?
ansible-playbook 48.tags.yml --list-tags

## Ansible reserves two tag names for special behavior: always and never
## If you assign the always tag to a task or play, Ansible will 
## always run that task or play, unless you specifically skip it (--skip-tags always).
## If you assign the never tag to a task or play, Ansible will skip
## that task or play unless you specifically request it (--tags never).

ansible-playbook 48.tags.yml
ansible-playbook 48.tags.yml --tags first
ansible-playbook 48.tags.yml --tags first,second
ansible-playbook 48.tags.yml --tags first,second,third
ansible-playbook 48.tags.yml --tags fifth
ansible-playbook 48.tags.yml --tags fifth --skip-tags third
ansible-playbook 48.tags.yml --tags fifth --skip-tags common
ansible-playbook 48.tags.yml --tags fifth,common
ansible-playbook 48.tags.yml --tags never
