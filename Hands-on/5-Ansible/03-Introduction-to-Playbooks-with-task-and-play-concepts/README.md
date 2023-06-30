# Introduction to Playbooks with task and play concepts
 - Playbook is a YAML file consisting of one or more tasks
 - It's the configuration, deployment and orchestration language of Ansible and it's expressed in YAML format
 - Structure of the Playbook
   - Playbook (Can have number of Plays)
     - Plays (Can have number of tasks)
       - Tasks
   - Each play can be targeted to a specific host group
   - 
 - Sample playbook - install_wget.yml
```
---
 - hosts: all
   become: yes
   tasks:
   - yum: name=wget state=absent
   - yum: name=vim state=present
```
 - Sample playbook - install_nginx.yml
```
---
 - hosts: web
   become: yes
   tasks:
   - yum: name=nginx state=present
```
- Run playbook
  - ansible-playbook install_wget.yml
  - ansible-playbook install_nginx.yml
- Club both playbooks together. It will then have multiple plays
  - vim install_wget_nginx.yaml
```
---
 - hosts: all
   become: yes
   tasks:
   - yum: name=wget state=present
   - yum: name=vim state=absent
 - hosts: web
   become: yes
   tasks:
   - yum: name=nginx state=absent
```
- Run playbook
  - ansible-playbook install_wget_nginx.yaml
