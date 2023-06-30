# Install a package like git, httpt, mysql, ngixnx
ansible all -m apt -a "name=git state=present" -b
ansible all -m apt -a "name=httpd state=present" -b

# Verify on target nodes
which git
which httpd