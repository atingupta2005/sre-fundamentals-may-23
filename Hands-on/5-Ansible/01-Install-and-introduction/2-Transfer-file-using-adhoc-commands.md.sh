docker container start $USER-ansible_client_1
docker container start $USER-ansible_client_2
docker container start $USER-ansible_client_3
docker container start $USER-ansible_client_4
docker container start $USER-ansible_client_5

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/01-Install-and-introduction

## Transfer a file using Ansible Ad-hoc command
ansible all -m copy -a "src=./hosts dest=/tmp/hosts-$USER"

ansible all -m copy -a "content='hello, this is Atn Gupta' dest=/tmp/hello-$USER.txt"

## Verify the content on the managed node
docker container exec $USER-ansible_client_1 ls /tmp/

docker container exec $USER-ansible_client_1 cat /tmp/hello-$USER.txt
docker container exec $USER-ansible_client_2 cat /tmp/hello-$USER.txt
docker container exec $USER-ansible_client_3 cat /tmp/hello-$USER.txt
docker container exec $USER-ansible_client_4 cat /tmp/hello-$USER.txt
docker container exec $USER-ansible_client_5 cat /tmp/hello-$USER.txt

## Overwrite with backup
ansible all -m copy -a "content='hello, this is Atin\n\n' dest=/tmp/hello-$USER.txt backup=yes"

## Verify the content and backup on the managed node
docker container exec $USER-ansible_client_1 ls /tmp
docker container exec $USER-ansible_client_2 ls /tmp
docker container exec $USER-ansible_client_3 ls /tmp
docker container exec $USER-ansible_client_4 ls /tmp
docker container exec $USER-ansible_client_5 ls /tmp
