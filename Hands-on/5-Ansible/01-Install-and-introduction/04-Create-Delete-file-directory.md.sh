# Create/Delete file or directory using Ansible Ad-hoc commands
ansible all -m file -a "path=/tmp/hello1.txt state=touch"
ansible all -m file -a "path=/tmp/hello2.txt state=touch mode='0777'"
ansible all -m file -a "path=/tmp/hello2.txt state=absent"
ansible all -m file -a "path=/tmp/hello state=directory"

# Run command with sudo privilidges
ansible all -m file -a "path=/etc/demo.txt state=touch" --become

# To check the host name on which the command will be executed
ansible all -m ping --list-hosts
