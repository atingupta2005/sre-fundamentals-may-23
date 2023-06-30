docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction

# Install a package like git, httpt, mysql, ngixnx
ansible all -m apt -a "name=git state=present" -b
ansible all -m apt -a "name=httpd state=present" -b

# Verify on target nodes
docker container exec $USER-ansible_client_1 git --version; curl localhost
docker container exec $USER-ansible_client_2 git --version; curl localhost
docker container exec $USER-ansible_client_3 git --version; curl localhost
docker container exec $USER-ansible_client_4 git --version; curl localhost
docker container exec $USER-ansible_client_5 git --version; curl localhost
