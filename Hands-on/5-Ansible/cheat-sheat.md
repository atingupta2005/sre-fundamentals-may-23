# Ansible Glossary

- The following Ansible-specific terms are largely used throughout this guide:

  - Control Machine / Node: a system where Ansible is installed and configured to connect and execute commands on nodes.
  - Node: a server controlled by Ansible.
  - Inventory File: a file that contains information about the servers Ansible controls, typically located at /etc/ansible/hosts.
  - Playbook: a file containing a series of tasks to be executed on a remote server.
  - Role: a collection of playbooks and other files that are relevant to a goal such as installing a web server.
  - Play: a full Ansible run. A play can have several playbooks and roles, included from a single playbook that acts as entry point.
- Testing Connectivity to Nodes
  - ansible all -m ping
- Using a Custom Inventory File
  - ansible all -m ping -i my_custom_inventory
- Running ad-hoc Commands
  - ansible all -a "uname -a"
  - ansible server1 -m apt -a "name=vim"
- Predict how the servers would be affected by your command:
    - ansible server1 -m apt -a "name=vim" --check
- Running Playbooks
  - ansible-playbook myplaybook.yml
- limit execution to a certain group or host
  - ansible-playbook -l server1 myplaybook.yml
- Getting Information about a Play
  - List all tasks that would be executed without making any changes:
  - ansible-playbook myplaybook.yml --list-tasks
- List all hosts that would be affected by a play, without running any tasks on the remote servers:
  - ansible-playbook myplaybook.yml --list-hosts
- Debugging
  - If you run into errors while executing Ansible commands and playbooks:
    - ansible-playbook myplaybook.yml -v
  - If you need more detail, you can use -vvv and this will increase verbosity of the output
    - ansible-playbook myplaybook.yml -vvvv
- Inventory Files & Hosts Patterns
  - all: All hosts in inventory
  - webservers: The group webservers
- Manage Packages
  - To ensure that a package is installed, but doesn’t get updated
    - ansible webservers -m apt -a "name=acme state=present"
  - To ensure that a package is installed to a specific version
    - ansible webservers -m apt -a "name=acme-1.5 state=present"
  - To ensure that a package at the latest version
    - ansible webservers -m apt -a "name=acme state=latest"
  - To ensure that a package is not installed
    - ansible webservers -m apt -a "name=acme state=absent
- Manage Services
  - To ensure a service is started on all web servers
    - ansible webservers -m service -a "name=httpd state=started"
  - To restart a service on all web servers
    - ansible webservers -m service -a "name=httpd state=restarted"
  - To ensure a service is stopped
    - ansible webservers -m service -a "name=httpd state=stopped
- PLAYBOOKS
  - run playbook with sudo
    - ansible-playbook -v config-users.yaml --sudo --sudo-user=joe --ask-sudo-pass
  - use different Hosts file
    - ansible-playbook -v -i /path/to/hosts
  - run playbook but only a specific task (tag)
    - ansible-playbook playbooks/restore_bitbucket.yaml -i hosts --tags rsync 
  - or to skip: (--skip-tags tag1, tag2)