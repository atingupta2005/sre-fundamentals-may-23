ansible-playbook 23-Print-any-message-using-playbook.yml
ansible-playbook 24-Print-Variable-Value.yml
ansible-playbook 25-Verbosity-Debug.yml       # Second task will skip
ansible-playbook 25-Verbosity-Debug.yml -v    # Second task will skip
ansible-playbook 25-Verbosity-Debug.yml -vv
ansible-playbook 26-Ansible-Variables.yml
ansible-playbook 27-data_structures.yml
ansible-playbook 28-register_set_facts.yml
ansible-playbook 29-Read-and-print-a-variable.yml
ansible-playbook 30-Read-variables-from-file.yml


## Working-with-command-line-arguements
ansible-playbook 31-Working-with-command-line-arguements.yml
ansible-playbook 31-Working-with-command-line-arguements.yml  -e "x=45"
ansible-playbook 31-Working-with-command-line-arguements.yml  --extra-var "{ 'x':  45, 'y': 67 }"
ansible-playbook 31-Working-with-command-line-arguements.yml  --extra-var "{ 'x':  45, 'y': {'one': 1, 'two': 2, 'three': 3} }"
ansible-playbook 31-Working-with-command-line-arguements.yml  --extra-var "@variables_values.yml"


## Command-line-arguements-install-packages
ansible-playbook  32-command-line-arguements-install-packages.yml -e "pkg=nginx req_state=present"
ansible-playbook  32-command-line-arguements-install-packages.yml -e "pkg=nginx req_state=absent"

ansible-playbook 33-without-facts.yml

ansible-playbook 33-working-with-gather-facts.yml

ansible-playbook 34-hostvars-inventory-hostname.yml

