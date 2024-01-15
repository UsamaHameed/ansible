# ansible

ansible playbooks to setup a linux machine

## to run:
```bash
ansible-playbook --ask-become-pass --ask-vault-pass local.yml
```

## encrypt and decrypt new secrets before pushing
```bash
ansible-vault encrypt <path-to-file>
ansible-vault decrypt <path-to-file>
```
