#!/bin/bash

yc compute instance delete prometeus
yc compute instance delete grafana
yc compute instance delete kibana
yc compute instance delete elastic
yc compute instance delete bastion
yc compute instance delete webserver2
yc compute instance delete webserver1




yc alb load-balancer delete balancer1

yc alb http-router delete router1

yc alb backend-group delete backend1

yc alb target-group delete target1



yc vpc subnet delete subnet1
yc vpc subnet delete subnet2
yc vpc subnet delete subnet3


yc vpc security-group delete bastion_sg
yc vpc security-group delete balancer_sg
yc vpc security-group delete kibana_sg
yc vpc security-group delete grafana_sg
yc vpc security-group delete webservers_sg
yc vpc security-group delete prometheus_sg
yc vpc security-group delete elastic_sg

yc vpc network delete network1