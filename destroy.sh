#!/bin/bash

ansible-playbook hosts_provision.yaml --extra-vars "state=absent"