#!/usr/bin/bash
ip_int_webserver1=$(terraform output internal_ip_address_webserver1)
ip_int_webserver2=$(terraform output internal_ip_address_webserver2)


ansible-playbook playbook_prometheus.yml -e "ip_int_webserver1=$ip_int_webserver1 ip_int_webserver2=$ip_int_webserver2"
