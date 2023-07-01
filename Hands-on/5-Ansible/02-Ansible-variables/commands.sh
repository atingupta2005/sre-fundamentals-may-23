# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/02-Ansible-variables

ansible all -m debug -a "var=inventory_hostname"
ansible all -m debug -a "msg={{inventory_hostname}}"
ansible all -m debug -a "var=groups"
ansible all -m debug -a "var=groups.keys()"

ansible all -m file -a "path=atin.txt state=touch"
