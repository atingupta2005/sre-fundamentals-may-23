# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/04-Points-to-run-Playbooks


##Run playbook having shebang string
chmod a+x ./install_wget_nginx.yaml
./install_wget_nginx.yaml

## To check syntax
ansible-playbook install_wget_nginx.yaml --syntax-check

## To dry run
ansible-playbook install_wget_nginx.yaml --check

## To check verbose log
ansible-playbook install_wget_nginx.yaml -v
ansible-playbook install_wget_nginx.yaml -vvv
ansible-playbook install_wget_nginx.yaml -vvvvvv


# List all tasks that would be executed without making any changes:
ansible-playbook install_wget_nginx.yaml --list-tasks

##   - run playbook but only a specific task (tag)
ansible-playbook install_wget_nginx.yaml -i hosts -t install_optional
ansible-playbook install_wget_nginx.yaml -i hosts -t install_optional
ansible-playbook install_wget_nginx.yaml -i hosts --skip-tags install_optional
