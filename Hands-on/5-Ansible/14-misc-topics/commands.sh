Passing multiple inventory sources
ansible-playbook 24-Print-Variable-Value.yml -i staging -i production --list-hosts

ansible-playbook 24-Print-Variable-Value.yml -i staging alpha.example.org --list-hosts

ansible-playbook 24-Print-Variable-Value.yml -i staging alpha.example.org:beta.example.org --list-hosts

ansible-playbook 24-Print-Variable-Value.yml -i staging webservers --list-hosts

ansible-playbook 24-Print-Variable-Value.yml -i staging webservers:dbservers --list-hosts

#Only servers that are both in webservers and dbservers
ansible-playbook 24-Print-Variable-Value.yml -i staging webservers:&dbservers --list-hosts

# Servers in webservers except those also in dbservers
ansible-playbook 24-Print-Variable-Value.yml -i staging webservers:!dbservers --list-hosts
