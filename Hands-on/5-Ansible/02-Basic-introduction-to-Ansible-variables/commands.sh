docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/02-Basic-introduction-to-Ansible-variables

ansible all -m debug -a "var=inventory_hostname"
ansible all -m debug -a "msg={{inventory_hostname}}"
ansible all -m debug -a "var=groups"
ansible all -m debug -a "var=groups.keys()"

ansible all -m file -a "path=atin.txt state=touch"
