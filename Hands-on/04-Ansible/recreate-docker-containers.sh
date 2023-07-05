uid=${USER:1:10}
echo $uid
echo 22$uid

docker container stop $USER-ansible_client_1 $USER-ansible_client_2 $USER-ansible_client_3 $USER-ansible_client_4 $USER-ansible_client_5
docker container rm -f $USER-ansible_client_1 $USER-ansible_client_2 $USER-ansible_client_3 $USER-ansible_client_4 $USER-ansible_client_5
docker run --name $USER-ansible_client_1 -itd -p 21$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_2 -itd -p 22$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_3 -itd -p 23$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_4 -itd -p 24$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled
docker run --name $USER-ansible_client_5 -itd -p 25$uid:22 atingupta2005/ubuntu_ssh_ssh_enabled


# ssh-keygen
rm -rf ~/.ssh/demo_id_rsa*
ssh-keygen -f ~/.ssh/demo_id_rsa -q -N ""

chmod 0600 ~/.ssh/demo_id_rsa

# Deploy Public Key to host
sshpass -p ansadmin@123 ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.1 -p 21$uid
sshpass -p ansadmin@123 ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.2 -p 22$uid
sshpass -p ansadmin@123 ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.3 -p 23$uid
sshpass -p ansadmin@123 ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.4 -p 24$uid
sshpass -p ansadmin@123 ssh-copy-id -i ~/.ssh/demo_id_rsa.pub ansadmin@127.0.0.5 -p 25$uid

