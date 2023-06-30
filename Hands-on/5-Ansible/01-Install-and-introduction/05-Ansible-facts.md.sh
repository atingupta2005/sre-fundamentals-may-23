docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction


# Ansible facts
## - Information about managed nodes
ansible all -m setup
ansible all -m setup -a "filter=ansible_mounts"
