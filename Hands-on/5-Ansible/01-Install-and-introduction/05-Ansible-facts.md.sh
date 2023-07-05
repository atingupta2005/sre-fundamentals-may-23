# Create Docker containers
#bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
#bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction


# Ansible facts
## - Information about managed nodes
ansible all -m setup
ansible all -m setup -a "filter=ansible_mounts"
