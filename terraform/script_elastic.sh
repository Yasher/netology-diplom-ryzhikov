#!/usr/bin/bash
# ip_vm=$(terraform output external_ip_address_vm_1_test)
# ip_promet=$(terraform output external_ip_address_promet1)
ip_ext_elastic=$(terraform output external_ip_address_elastic)
ip_int_elastic=$(terraform output internal_ip_address_elastic)
ip_ext_kibana=$(terraform output external_ip_address_kibana)
# echo "[webservers]
# $ip_vm
# [prometheus]
# $ip_promet
echo "
[elastic]
elastic ansible_host=$ip_ext_elastic
[kibana]
kibana ansible_host=$ip_ext_kibana" > hosts

#ansible-playbook playbook_prometheus.yml -e "ip_vm=$ip_vm"
ansible-playbook playbook_elastic.yml -e "ip_int_elastic=$ip_int_elastic"
