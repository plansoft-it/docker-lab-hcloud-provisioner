# Docker Lab provisioner for Hetzner Cloud 
## Setup
* create a file secrets.yaml under vars directory with the following content:
```
api_key: <Hetzner api key with write permission>
user_password: <encrypted password>
```
To generate the encrypted password for the user:

`python3 -c 'import crypt; print crypt.crypt("mypassword", "$1$SomeSalt$")'
`
* create an ssh key in the Hetzner cloud console
* adjust in the `vars/terraform.yaml` values:
```
image: ubuntu-20.04
server_type: cx11
ssh_key: <your ssh key name in Hetzner cloud console>
number_of_nodes: <number of desidered nodes to be created>
```
* launch the create.sh script:
```
./create.sh
```
Now you can view the list of provisioned nodes ip address in the hosts.cfg file. You simply need to supply each address, the username `corso` and the password chosen above to each student.

Enjoy!

## Destroy your lab
To destroy your entire lab simply launch the destroy.sh script:
```
./destroy.sh
```