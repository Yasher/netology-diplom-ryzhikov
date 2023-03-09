#!/bin/bash

#Раскатываем инфраструктуру в яндекс облаке
terraform apply  -auto-approve

#Формируем inventory-файл
./script_hosts.sh

#Деплой ПО на серверах
./script_webserver.sh
./script_elastic.sh
./script_filebeat.sh
./script_prometeus.sh
./script_grafana.sh


terraform apply  -auto-approve