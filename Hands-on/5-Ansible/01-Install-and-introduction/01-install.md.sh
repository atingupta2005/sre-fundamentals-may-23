cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction

# Installation:
sudo apt update
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

# ssh-keygen
ssh-keygen -f ~/.ssh/demo_id_rsa
ls -al  ~/.ssh/
chmod 0600 ~/.ssh/demo_id_rsa

# Update Hosts: - hosts

# Update SSH Key File Path:

uid=${USER:1:10}
echo $uid
echo 22$uid

# Create Docker containers
docker container ls
docker container rm -f $USER-ansible_client_1 $USER-ansible_client_2 $USER-ansible_client_3 $USER-ansible_client_4 $USER-ansible_client_5
docker run --name $USER-ansible_client_1 -itd -p 21$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_2 -itd -p 22$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_3 -itd -p 23$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_4 -itd -p 24$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_5 -itd -p 25$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker container ls
docker container inspect $USER-ansible_client_1 | grep IPAddress
docker container inspect $USER-ansible_client_2 | grep IPAddress
docker container inspect $USER-ansible_client_3 | grep IPAddress
docker container inspect $USER-ansible_client_4 | grep IPAddress
docker container inspect $USER-ansible_client_5 | grep IPAddress

# Deploy Public Key to host
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.1 -p 21$uid
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.2 -p 22$uid
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.3 -p 23$uid
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.4 -p 24$uid
ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.5 -p 25$uid

# Test the key
ssh -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 21$uid
exit
ssh -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.2 -p 22$uid
exit
ssh -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.3 -p 23$uid
exit
ssh -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.4 -p 24$uid
exit
ssh -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.5 -p 25$uid
exit

ansible all -i hosts -m ping

# Running ad hoc commands
ansible all -i hosts -a uptime
ansible group1 -i hosts -a "free -m"
ansible group1:group2 -i hosts -a "df -h"
 
# Ansible Adhoc Commands
ansible all -m ping
ansible all -m shell -a "uptime"
ansible all -m shell -a "free -m"
ansible group2:group1 -m shell -a "free -m"

## Create another inventory file - my_inventory

## Run commands on new invetory
ansible -i my_inventory all  -m shell -a "free -m"

## Playbook: A group of all these commands in a file


docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5
