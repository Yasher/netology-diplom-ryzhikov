#!/bin/bash

# ddd=$(ansible-playbook test_playbook1.yml)

# echo $ddd


sed -i 's/nat       =.*/nat       = true/' ./vm1.tf
sed -i 's/nat       =.*/nat       = true/' ./vm2.tf
