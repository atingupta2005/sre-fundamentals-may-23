cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/01-Install-and-introduction

# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

# Install a package like git, httpt, mysql, ngixnx
ansible all -m apt -a "name=git state=present" -b
ansible all -m apt -a "name=httpd state=present" -b

echo "Wait for 30 seconds"
sleep 30
# Verify on target nodes
docker container exec $USER-ansible_client_1 git --version; curl localhost
docker container exec $USER-ansible_client_2 git --version; curl localhost
docker container exec $USER-ansible_client_3 git --version; curl localhost
docker container exec $USER-ansible_client_4 git --version; curl localhost
docker container exec $USER-ansible_client_5 git --version; curl localhost
