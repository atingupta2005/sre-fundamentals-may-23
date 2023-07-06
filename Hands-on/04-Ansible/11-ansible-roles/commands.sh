# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/04-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/04-Ansible/11-ansible-roles

# Ansible Roles
## - Roles are the best way to reuse playbook

## Converting a playbook to Ansible Roles
## - Create ansible.cfg in current directory
  ## Already done
ls ansible.cfg

## - Provide path (roles_path) to roles directory in ansible.cfg
  ## Already done
cat ansible.cfg | grep roles_path


### Create Update Roles
rm -rf roles
mkdir -p roles

ansible-galaxy init roles/update_repos --offline
tree roles/update_repos
cat > roles/update_repos/tasks/main.yml << EOL
- name: Updating repos
  apt:
    name: "*"
    state: latest
EOL

### Create Role to install and configure java path
ansible-galaxy init roles/xyz_java --offline

cat > roles/xyz_java/tasks/main.yml << EOL
- name: Installing required java
  apt:
    name: "{{req_java}}"
    state: present
EOL

cat > roles/xyz_java/vars/main.yml << EOL
req_java: openjdk-8-jdk
EOL

rm install-java.yml
cat > install-java.yml << EOL
- name: using roles
  hosts: all
  gather_facts: false
  become: yes
  roles:
    - update_repos
    - xyz_java
EOL

### Run the playbook
ansible-playbook install-java.yml


docker container exec $USER-ansible_client_1 java -version
docker container exec $USER-ansible_client_2 java -version
docker container exec $USER-ansible_client_3 java -version
docker container exec $USER-ansible_client_4 java -version
docker container exec $USER-ansible_client_5 java -version

