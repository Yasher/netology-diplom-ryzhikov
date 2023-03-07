#!/usr/bin/bash
ip_int_elastic=$(terraform output internal_ip_address_elastic | sed 's/\"//g') 


ansible-playbook playbook_filebeat.yml -e "ip_int_elastic=$ip_int_elastic:5044"