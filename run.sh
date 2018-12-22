#!/bin/bash
test -f env/bin/activate && . env/bin/activate
ansible-playbook -i hosts main.yml --ask-pass "$@"
tput bel
