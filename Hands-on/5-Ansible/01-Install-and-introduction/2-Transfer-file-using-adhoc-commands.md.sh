## Transfer a file using Ansible Ad-hoc command
ansible all -m copy -a "src=./hosts dest=/tmp"

ansible all -m copy -a "src=./hosts dest=/tmp"

ansible all -m copy -a "content='hello, this is Atn Gupta' dest=/tmp/hello.txt"

## Verify the content on the managed node
cat /tmp/hello.txt

## Overwrite with backup
ansible all -m copy -a "content='hello, this is Atin\n\n' dest=/tmp/hello.txt backup=yes"

## Verify the content and backup on the managed node
