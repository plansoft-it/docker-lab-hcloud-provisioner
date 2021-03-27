#!/bin/bash

ansible-playbook hosts_provision.yaml --extra-vars "state=present"

echo "Waiting 60 seconds..."
sleep 60

ansible-playbook setup.yaml --inventory-file ./hosts.cfg
