#!/bin/bash

yc compute instance stop prometeus
yc compute instance stop grafana
yc compute instance stop kibana
yc compute instance stop elastic
yc compute instance stop bastion
yc compute instance stop webserver2
yc compute instance stop webserver1




yc alb load-balancer stop balancer1
