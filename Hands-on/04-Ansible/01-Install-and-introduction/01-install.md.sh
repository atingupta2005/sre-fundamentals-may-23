cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/01-Install-and-introduction

# Installation:
sudo apt update
p
sudo apt -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
sudo apt-get install sshpass -y

# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

uid=${USER:1:10}
echo $uid
echo 22$uid

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

# Update Hosts: - hosts

# Update SSH Key File Path:


ansible all -i hosts -m ping

# Running ad hoc commands
cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/01-Install-and-introduction
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
