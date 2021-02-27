#!/bin/bash

ansible-playbook hosts_provision.yaml --extra-vars "state=present"

sleep 120

ansible-playbook setup.yaml --inventory-file ./hosts.cfg
