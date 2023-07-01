# Create Docker containers
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/recreate-docker-containers.sh
bash ~/sre-fundamentals-may-23/Hands-on/5-Ansible/start-docker-containers.sh

cd ~/sre-fundamentals-may-23/Hands-on/5-Ansible/11-ansible-roles

# Ansible Roles
## - Roles are the best way to reuse playbook

## Converting a playbook to Ansible Roles
## - We need to convert the playbook - install_and_configure_tomcat.yml
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

## Copy task (update_repos) from install_and_configure_tomcat.yml
cat > roles/update_repos/tasks/main.yml << EOL
- name: Updating repos
  yum:
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
- name: Setting default java
  alternatives:
    name: java
    link: /usr/bin/java
    path: /usr/lib/jvm/{{set_java}}/bin/java
EOL

cat > roles/xyz_java/vars/main.yml << EOL
req_java: java-1.8.0-openjdk
set_java: jre-1.8.0-openjdk
EOL

rm install-and-configure-tomcat-java.yml
cat > install-and-configure-tomcat-java.yml << EOL
- name: using roles
  hosts: all
  gather_facts: false
  become: yes
  roles:
    - update_repos
    - xyz_java
    - xyz_tomcat

### Create Role to download and install tomcat
- ansible-galaxy init roles/xyz_tomcat
- nano roles/xyz_tomcat/vars/main.yml

```
req_tomcat_ver: 9.0.41
tomcat_url: http://mirrors.estointernet.in/apache/tomcat/tomcat-{{req_tomcat_ver.split('.')[0]}}/v{{req_tomcat_ver}}/bin/apache-tomcat-{{req_tomcat_ver}}.tar.gz
tomcat_port: 8090
```
- Copy server.xml.j2 to templates directory

```

cp server.xml.j2 roles/xyz_tomcat/templates

```

- nano roles/xyz_tomcat/tasks/main.yml

```
- name: Downloading required tomcat
  get_url:
    url: "{{tomcat_url}}"
    dest: /usr/local
- name: Extracting downloaded tomcat
  unarchive:
    src: "/usr/local/apache-tomcat-{{req_tomcat_ver}}.tar.gz"
    dest: /usr/local
    remote_src: yes
- name: Renaming tocmcat home
  command: mv /usr/local/apache-tomcat-{{req_tomcat_ver}} /usr/local/latest
- name: Replacing default port with required port
  template:
    src: templates/server.xml.j2
    dest: /usr/local/latest/conf/server.xml
```

- nano install-and-configure-tomcat-java.yml    #Its the main playbook which will use roles

```all
---
- name: using roles
  hosts: all
  gather_facts: false
  become: yes
  roles:
    - update_repos
    - xyz_java
    - xyz_tomcat
```

### Setup handlers to start tomcat
- nano roles/xyz_tomcat/handlers/main.yml

```
- name: start_tomcat
  shell:  nohup /usr/local/latest/bin/startup.sh &
```

### Put handler
- nano roles/xyz_tomcat/tasks/main.yml

```
- name: Downloading required tomcat
  get_url:
    url: "{{tomcat_url}}"
    dest: /usr/local
- name: Extracting downloaded tomcat
  unarchive:
    src: "/usr/local/apache-tomcat-{{req_tomcat_ver}}.tar.gz"
    dest: /usr/local
    remote_src: yes
- name: Renaming tocmcat home
  command: mv /usr/local/apache-tomcat-{{req_tomcat_ver}} /usr/local/latest
- name: Replacing default port with required port
  template:
    src: templates/server.xml.j2
    dest: /usr/local/latest/conf/server.xml
  notify: start_tomcat
```

### Run the playbook
- ansible-playbook install-and-configure-tomcat-java.yml
- curl localhost:8090


### Creating Custom Ansible Roles
- Do you need a role, but you can’t find it in Ansible Galaxy? Follow our guide to creating your own.

[Creating Custom Ansible Roles](https://azurecitadel.com/automation/packeransible/lab5/)
