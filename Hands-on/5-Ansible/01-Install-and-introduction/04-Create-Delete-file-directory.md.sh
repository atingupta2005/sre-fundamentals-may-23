docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction

# Create/Delete file or directory using Ansible Ad-hoc commands
ansible all -m file -a "path=/tmp/hello1-$USER.txt state=touch"
ansible all -m file -a "path=/tmp/hello2-$USER.txt state=touch mode='0777'"
ansible all -m file -a "path=/tmp/hello2-$USER.txt state=absent"
ansible all -m file -a "path=/tmp/hello-$USER state=directory"

# Run command with sudo privilidges
ansible all -m file -a "path=/tmp/demo-$USER.txt state=touch" --become

# To check the host name on which the command will be executed
ansible all -m ping --list-hosts

docker container exec $USER-ansible_client_1 sudo ls /tmp/

