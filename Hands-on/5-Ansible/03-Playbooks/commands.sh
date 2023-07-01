docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/03-Playbooks


ansible-playbook install_wget.yml
ansible-playbook install_nginx.yml
ansible-playbook install_wget_nginx.yaml
