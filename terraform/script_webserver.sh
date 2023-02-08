#!/bin/bash
ip_ext_elastic=$(terraform output external_ip_address_elastic)
ip_int_elastic=$(terraform output internal_ip_address_elastic)
ip_ext_kibana=$(terraform output external_ip_address_kibana)
ip_ext_webserver1=$(terraform output external_ip_address_webserver1)
ip_ext_webserver2=$(terraform output external_ip_address_webserver2)


echo "
[webservers]
webserver1 ansible_host=$ip_ext_webserver1
webserver2 ansible_host=$ip_ext_webserver2
[elastic]
elastic ansible_host=$ip_ext_elastic
[kibana]
kibana ansible_host=$ip_ext_kibana" > hosts

#ansible-playbook playbook_prometheus.yml -e "ip_vm=$ip_vm"
#ansible-playbook playbook_elastic.yml -e "ip_int_elastic=$ip_int_elastic"

ansible-playbook playbook_webserver.yml