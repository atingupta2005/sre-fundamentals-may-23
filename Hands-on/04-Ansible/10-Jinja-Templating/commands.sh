# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/10-Jinja-Templating

ansible-playbook 1.Creating-template-files.yml
ssh -o StrictHostKeyChecking=no -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 2150 cat  /home/ansadmin/example_file.txt
ssh -o StrictHostKeyChecking=no -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 2250 cat  /home/ansadmin/example_file.txt
ssh -o StrictHostKeyChecking=no -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 2350 cat  /home/ansadmin/example_file.txt
ssh -o StrictHostKeyChecking=no -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 2450 cat  /home/ansadmin/example_file.txt
ssh -o StrictHostKeyChecking=no -i ~/.ssh/demo_id_rsa ansadmin@127.0.0.1 -p 2550 cat  /home/ansadmin/example_file.txt
