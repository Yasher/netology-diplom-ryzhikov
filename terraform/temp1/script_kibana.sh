#!/usr/bin/bash
ip_vm=$(terraform output external_ip_address_vm_1_test)
ip_promet=$(terraform output external_ip_address_promet1)
ip_ext_elastic=$(terraform output external_ip_address_elastic)

echo "[webservers]
$ip_vm
[prometheus]
$ip_promet
[elastic]
$ip_ext_elastic" > hosts

#ansible-playbook playbook_prometheus.yml -e "ip_vm=$ip_vm"
ansible-playbook playbook_elastic.yml
