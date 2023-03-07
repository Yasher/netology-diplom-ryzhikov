#!/bin/bash
ip_ext_grafana=$(terraform output external_ip_address_grafana | sed 's/\"//g')

#ansible-playbook playbook_grafana.yml

uid=$(curl -X POST --insecure -H "Accept: application/json" -H "Content-Type: application/json" -d @datasource.json http://admin:Admin@$ip_ext_grafana:3000/api/datasources | awk -F"\"" {'print $8'})
#uid=!!!uuuiiiddd!!!
curl https://slava.fvds.ru/packages/dashboard.json -o dashboard.json
sed -i 's/###uid###/'$uid'/' dashboard.json
curl -X POST --insecure -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"dashboard\":$(cat dashboard.json)}" http://admin:Admin@$ip_ext_grafana:3000/api/dashboards/db