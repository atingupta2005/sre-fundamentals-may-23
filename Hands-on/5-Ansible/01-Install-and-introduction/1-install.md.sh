# Installation:
sudo apt update
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

# ssh-keygen
ssh-keygen -f ~/.ssh/demo_id_rsa
chmod 0600 ~/.ssh/demo_id_rsa
 
# Update Hosts: - hosts

# Update SSH Key File Path:

# Create Docker containers
docker run --name ansible_client_1 -itd -p 8021:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name ansible_client_2 -itd -p 8022:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name ansible_client_3 -itd -p 8023:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name ansible_client_4 -itd -p 8024:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name ansible_client_5 -itd -p 8025:22 atingupta2005/ubuntu_ssh_ssh_enabled

# Deploy Public Key to host
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ansible_client_1
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ansible_client_2
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ansible_client_3
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ansible_client_4
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ansible_client_5

# Test the key
ssh -i ~/.ssh/demo_id_rsa demouser@ansible_client_1
ssh -i ~/.ssh/demo_id_rsa demouser@ansible_client_2
ssh -i ~/.ssh/demo_id_rsa demouser@ansible_client_3
ssh -i ~/.ssh/demo_id_rsa demouser@ansible_client_4
ssh -i ~/.ssh/demo_id_rsa demouser@ansible_client_5

# Test Ansible is able to conenct to all hosts
ansible all -i hosts -m ping

# Running ad hoc commands
ansible all -i hosts -a uptime
ansible group1 -i hosts -a "free -m"
ansible group1:group2 -i hosts -a "df -h"
 
# Ansible Adhoc Commands
ansible groups -m ping
ansible groups -m shell -a "uptime"
ansible groups -m shell -a "free -m"
ansible group2:group1 -m shell -a "free -m"

## Create another inventory file - my_inventory

## Run commands on new invetory
ansible -i my_inventory all  -m shell -a "free -m"

## Playbook: A group of all these commands in a file

