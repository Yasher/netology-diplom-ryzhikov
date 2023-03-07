#!/bin/bash

# ddd=$(ansible-playbook test_playbook1.yml)

# echo $ddd


sed -i 's/nat       =.*/nat       = false/' ./vm1.tf
sed -i 's/nat       =.*/nat       = false/' ./vm2.tf

terraform apply -auto-approve 
terraform apply -auto-approve 
