#!/bin/bash
echo "########## Деплой grafana! ##########"
ip_int_prometheus=$(terraform output internal_ip_address_promet | sed 's/\"//g')

ip_ext_grafana=$(terraform output external_ip_address_grafana | sed 's/\"//g')

read -t 30 -p "Waiting a little ..."

ansible-playbook playbook_grafana.yml

read -t 30 -p "Waiting a little ..."

curl https://slava.fvds.ru/packages/datasource.json -o datasource.json
sed -i 's/###prometheus_ip###/'$ip_int_prometheus'/' datasource.json
uid=$(curl -X POST --insecure -H "Accept: application/json" -H "Content-Type: application/json" -d @datasource.json http://admin:admin@$ip_ext_grafana:3000/api/datasources | awk -F"\"" {'print $8'})
#uid=$(curl -X POST --insecure -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"dashboard\":$(cat datasource.json)}" http://admin:admin@$ip_ext_grafana:3000/api/datasources | awk -F"\"" {'print $8'})
curl https://slava.fvds.ru/packages/dashboard.json -o dashboard.json
sed -i 's/###uid###/'$uid'/' dashboard.json
curl -X POST --insecure -H "Accept: application/json" -H "Content-Type: application/json" -d "{\"dashboard\":$(cat dashboard.json)}" http://admin:admin@$ip_ext_grafana:3000/api/dashboards/db