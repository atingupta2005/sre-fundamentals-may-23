# Ansible facts
## - Information about managed nodes
ansible all -m setup
ansible all -m setup -a "filter=ansible_mounts"
