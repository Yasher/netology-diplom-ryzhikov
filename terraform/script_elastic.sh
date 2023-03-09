#!/usr/bin/bash

echo "########## Деплой elasticsearch и kibana! ##########"
ip_int_elastic=$(terraform output internal_ip_address_elastic)

ansible-playbook playbook_elastic.yml -e "ip_int_elastic=$ip_int_elastic"
ansible-playbook playbook_logstash.yml